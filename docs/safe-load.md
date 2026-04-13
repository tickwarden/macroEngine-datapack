# AME Safe Load System

**Introduced in v3.0.4-pre1**

---

## Problem

The `minecraft:load` function tag fires on **two distinct events**:

1. `/reload` — admin-initiated datapack reload
2. World open / server start — automatic, may fire with no players online

Both trigger `ame_load:_` simultaneously. If `macro:engine` storage already contains live session data (permissions maps, flag tables, wand bind registries, PID sequences, etc.) from a prior session, any unconditional `data modify storage macro:engine X set value Y` call **silently overwrites** that data.

This causes:

- **Overwrite**: existing permission entries wiped, custom flags reset, wand binds lost
- **Nondeterministic behaviour**: outcome depends on whether disable was called before reload, which varies per session

The root cause is a design assumption that AME always starts in a clean-slate environment. That assumption fails in production.

---

## Solution — Confirmation Gate

`ame_load:_` (Stage 0) **no longer calls `ame_load:load/all` directly.**

Instead it opens a confirmation gate:

```
ame_load:_
  └─ summon marker → ame_load:load/confirm (runs as marker) → kill marker
       ├─ sets #pending ame.load 1
       ├─ broadcasts instructions via marker say  ← safe at server start
       └─ schedules ame_load:timeout (5 minutes)

Admin: /function ame_load:load/yes
  └─ removes ame.load objective → schedules ame_load:load/all (t+1)
       └─ full init pipeline runs

Admin: /function ame_load:load/no
  └─ clears gate, removes ame.load objective, engine stays uninitialized

5 minutes with no response:
  └─ ame_load:timeout → ame_load:load/no (auto-cancel)
```

`macro:engine` storage is **never touched** until `ame_load:load/yes` is called.

---

## Why Marker Entity Pattern

All gate messages use `summon marker → say → kill` instead of `tellraw @a`.

**Reason**: `tellraw @a` with `clickEvent` is unreliable at server startup:

- The client connection pipeline is incomplete when `minecraft:load` fires
- `clickEvent` requires a fully initialized chat component context
- Zero players may be online (unattended/headless server)

The marker `say` command writes directly to the server log (`[AME] <AME GATE> ...`) and is immune to all of these conditions.

---

## Scoreboard: `ame.load`

| Score | Values | Meaning |
|---|---|---|
| `#pending ame.load` | `1` | Gate is open, waiting for response |
| `#confirmed ame.load` | `1` | `/yes` was called (transient) |
| `#cancelled ame.load` | `1` | `/no` was called or timeout fired |

The objective is created in `ame_load:load/confirm` and removed by `ame_load:load/yes` or `ame_load:load/no` after handling. It does not exist outside the gate window.

---

## Benefits

| Scenario | Behaviour |
|---|---|
| First world load | Gate opens → admin confirms → init runs |
| `/reload` with live engine | Gate opens → admin confirms → validate blocks (already loaded) |
| `/reload` after `macro:disable` | Gate opens → admin confirms → clean init |
| Unattended server (no admins online) | Timeout fires after 5 min → auto-cancel → no data corruption |
| Admin forgets to respond | Same as above |
| Multiplayer (multiple admins) | First `/yes` wins — double-call guard is idempotent |

---

## Retrying After Cancel

If load was cancelled (explicit or timeout):

```
/reload
```

or, without a full reload:

```
/function ame_load:_
```

`ame_load:_` is safe to call directly — it re-runs Stage 0, re-opens the gate, and reschedules the timeout.

---

## Dangerous Command Gate

The same confirm/cancel pattern applies to three destructive commands:

| Command | Action |
|---|---|
| `macro:cmd/ban` | Bans a player |
| `macro:cmd/ban_ip` | Bans a player's IP |
| `macro:disable` | Shuts down the engine (wipes all storage + scoreboards) |

These now store their parameters in `macro:engine pending_gate` and call `ame_load:gate/request`, which opens a **30-second** confirmation window.

### Confirming

```
/function ame_load:gate/yes
```

### Cancelling

```
/function ame_load:gate/no
```

Auto-cancel fires after **30 seconds** if no response.

### Scoreboard: `ame.gate`

| Score | Meaning |
|---|---|
| `#pending ame.gate == 1` | Gate open, waiting for response |
| `#confirmed ame.gate == 1` | `/yes` was called (transient) |

The objective is removed after the gate closes.

### Adding New Dangerous Commands

1. Write the actual executor in `ame_load:gate/exec/<name>.mcfunction`
   - Use `$command $(field)` pattern for macro parameters
   - Every `$` line must contain at least one `$(key)`
2. In the command function: write context to `macro:engine pending_gate`, call `ame_load:gate/request`
3. Add a dispatch line in `ame_load:gate/yes.mcfunction`:
   ```
   execute if data storage macro:engine pending_gate{type:"your_type"} run function ame_load:gate/exec/your_name with storage macro:engine pending_gate
   ```

---

## Storage Safety in `storages.mcfunction`

Every field in `ame_load:load/storages` now uses `execute unless data storage macro:engine X run ...` guards. Fields that are **intentionally** reset on reload are documented inline with the reason. No field is overwritten silently.

Fields intentionally cleared on reload:
- `fibers._pending` — incomplete fibers cannot be resumed across reload boundary
- `region_watches` — all packs must re-register in `#macro:init`; registrations are transient
- `batches` — incomplete batches cannot resume (execution context is gone)
