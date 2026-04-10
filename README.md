# 🔧 Advanced Macro Engine
**Minecraft Java Edition 1.21.x | Multiplayer-Safe | Pure Datapack**

---


## ✅ Verification

> ⚠️ **This is the ONLY official source.**
> Files downloaded from other sites or forks may have been modified.
> Only download from the [Releases](https://github.com/tickwarden/macroEngine-datapack/releases) page.

**SHA256:** `b6b929a5aa102bd011d2b27c2536bd7add3a8fa0072976ae4f55db38c4abe82e`

```bash
# Windows
certutil -hashfile datapack.zip SHA256

# Linux / Mac
sha256sum datapack.zip
```

---

## 📦 Installation

```
1. Place macroEngine-dp-main.zip/macroEngine-dp into your <server name>/world/datapacks/ folder
2. /reload
3. Become an admin: /tag @s add macro.admin
```

---

## 🏗️ Storage Architecture

```
macro:engine  (persistent data)
├── global
│   ├── version: "v3.0.2"
│   └── tick: <int>
├── players
│   └── Steve { coins:150, level:5, xp:2300, online:1b, ... }
├── queue
│   └── [{func:"mypack:event/end", delay:100}]
├── cooldowns
│   └── Steve { fireball: 2460, dash: 1870 }  ← expiry ticks
└── events
    └── on_join: [{func:"mypack:welcome"}, {func:"mypack:xp_bonus"}]

macro:input   (sending data to a function)
macro:output  (receiving results from a function)
```

---

## 🔍 Predicate System — `macro:predicate/*`

Used with `execute if predicate <id>`.

| Predicate ID | Description |
|---|---|
| `macro:is_survival` | Is the player in survival mode? |
| `macro:is_creative` | Is the player in creative mode? |
| `macro:has_empty_mainhand` | Is the player's main hand empty? |
| `macro:is_full_health` | Is the player at full health? (20 HP) |
| `macro:is_sneaking` | Is the player sneaking? |
| `macro:is_sprinting` | Is the player sprinting? |
| `macro:is_burning` | Is the player on fire? |
| `macro:is_on_ground` | Is the player on the ground? |
| `macro:is_daytime` | Is it daytime? (0–12000 ticks) |
| `macro:is_raining` | Is it raining? |
| `macro:is_thundering` | Is there a thunderstorm? |
| `macro:in_overworld` | Is the player in the Overworld? |
| `macro:in_nether` | Is the player in the Nether? |
| `macro:in_end` | Is the player in the End? |

---

## 📚 API Reference & Examples

Code and examples are split into separate documents by module:

| Module | Document |
|--------|----------|
| 🕐 Cooldown | [cooldown.md](docs/cooldown.md) |
| 📡 Event | [event.md](docs/event.md) |
| 🔢 Math | [math.md](docs/math.md) |
| 👥 Team & ⚙️ Config | [team-config.md](docs/team-config.md) |
| 🔁 Lib · 👤 Player · ⚙️ Commands · 💬 Messaging · Dialog | [docs/lib-player-cmd-string.md](lib-player-cmd-string.md) |

---

## 🩹 Changelog

### v3.0 — Bug Fixes & New Modules

| Bug | File | Fix |
|-----|------|-----|
| **CRITICAL**: `$epoch` was being reset on `/reload` | `load.mcfunction` | Added `unless score $epoch` guard |
| `process_queue` stack overflow risk | `lib/process_queue` | Added `$pq_depth` limit of 256 per tick |
| Version string inconsistency | `load`, `pack.mcmeta` | All references updated to v3.0 |

**New modules:** `math/abs`, `math/clamp`, `team/*`, `config/*`, `lib/input_push`, `lib/input_pop`

### v2.4 — Bug Fixes

| Bug | File | Fix |
|-----|------|-----|
| **CRITICAL**: Cooldowns never expired | `cooldown/*` | Switched to `$epoch macro.time` (absolute counter) |
| `progress_bar` was displaying raw numbers | `string/progress_bar` | Added `█░` lookup table |
| `fire_next` NBT predicate was incorrect | `event/internal/fire_next` | Fixed `event_queue[0]` path check |
| `ceil_div` prefix conflict | `math/ceil_div` | `$cd_1` → `$cdv_1` |

### v2.3 — New Systems

Added `cooldown/`, `event/`, `lib/`, `math/`, `cmd/`, `string/`, `player/` modules.

### v2.2 — Bug Fixes

| Bug | Fix |
|-----|-----|
| `data remove storage macro:input {}` was invalid | `data modify ... set value {}` |
| Subtitle color was hardcoded as `"gray"` | Made dynamic with `"color":"$(color)"` |

---

## 💬 Community & Support

[![Discussions](https://img.shields.io/github/discussions/tickwarden/macroEngine-datapack?style=for-the-badge&logo=github&color=blue)](https://github.com/tickwarden/macroEngine-datapack/discussions)

[GitHub Discussions](https://github.com/tickwarden/macroEngine-datapack/discussions) — For questions, suggestions, and bug reports.

---

*Advanced Macro Engine v3.0 | MC Java 1.21.x | Language: mcfunction*
