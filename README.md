# 🔧 Advanced Macro Engine
**Minecraft Java Edition 1.20.3–1.21.6+ | Multiplayer-Safe | Pure Datapack**


> Current version: **v4.0.2**

> 📦 **Moved from `ToolkitMC/macroEngine-dp`** — This is the new official repository. The old repo is archived (read-only). Update your remotes and bookmarks. See the [Migration Guide](docs/wiki/Migration-Guide.md) for details.

> 📚 **Wiki** — Full API reference, examples, and guides: [docs/wiki/](docs/wiki/) *(GitHub Wiki coming soon)*

---

## ✅ Verification

> ⚠️ **This is the ONLY official source.**
> Files downloaded from other sites or forks may have been modified.
> Only download from the [Releases](https://github.com/tickwarden/macroEngine-datapack/releases) page.

**SHA256:** *dcc86cacc48edbb48c4814ae4346a8734d787b593b94f8ca93f0f9f64116f6fb*

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
3. /function ame_load:load/yes
4. Become an admin: /tag @s add macro.admin
```

---

## 📚 Dependencies & Libraries

### Lantern Load
**Repository:** https://github.com/LanternMC/load  
**Purpose:** Datapack load order management and version resolution  
**License:** BSD 0-Clause (public domain)

Lantern Load provides:
- Deterministic load order across datapacks
- Version tracking via `load.status` scoreboard
- Pre-load, load, and post-load hooks

**macroEngine version detection:**
```mcfunction
# Check if macroEngine is loaded
execute if score macroEngine load.status matches 1.. run say macroEngine is loaded

# Get version (format: major*10000 + minor*100 + patch)
# Example: v3.0.4 = 30004
scoreboard players get macroEngine load.status
```

### StringLib
**Repository:** https://github.com/CMDred/StringLib  
**Purpose:** String manipulation (concat, find, replace, split, insert, case conversion)  
**License:** MIT

Bundled directly into the pack under the `stringlib` namespace. Exposed via `macro:lib/string/*` wrappers — see [API Reference](#-api-reference--examples) below.

---

## 🏗️ Storage Architecture

```
macro:engine  (persistent data)
├── global
│   ├── version: "v4.0.1"
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
| 📡 Event | [event.md](https://github.com/tickwarden/macroEngine-datapack/blob/main/docs/event.md) |
| 🔢 Math | [math.md](https://github.com/tickwarden/macroEngine-datapack/blob/main/docs/math.md) |
| 👥 Team & ⚙️ Config | [team-config.md](https://github.com/tickwarden/macroEngine-datapack/blob/main/docs/team-config.md) |
| 🔁 Lib · 👤 Player · ⚙️ Commands · 💬 Messaging · Dialog · Other | [lib-player-cmd-string.md](https://github.com/tickwarden/macroEngine-datapack/blob/main/docs/lib-player-cmd-string.md) |
| 🔤 String (StringLib) | see below |

### 🔤 `macro:lib/string/*`

All functions read from `macro:input` and write to `macro:output string.result`.

| Function | Input fields | Output |
|---|---|---|
| `lib/string/concat` | `list` (string array) | combined string |
| `lib/string/find` | `string`, `find`, `n` | index list, or `[-1]` |
| `lib/string/replace` | `string`, `find`, `replace`, `n` | modified string |
| `lib/string/split` | `string`, `separator`, `n`, `keep_empty` | string list |
| `lib/string/insert` | `string`, `insertion`, `index` | modified string |
| `lib/string/to_lowercase` | `string` | lowercase (A–Z only, fast) |
| `lib/string/to_lowercase_full` | `string` | lowercase (full Unicode) |
| `lib/string/to_uppercase` | `string` | uppercase (a–z only, fast) |
| `lib/string/to_uppercase_full` | `string` | uppercase (full Unicode) |
| `lib/string/to_number` | `string` | numeric NBT value |
| `lib/string/to_string` | `value` | string representation |

**Example — replace:**
```mcfunction
data modify storage macro:input string set value "Hello World"
data modify storage macro:input find set value "World"
data modify storage macro:input replace set value "Everyone"
function macro:lib/string/replace
# macro:output string.result → "Hello Everyone"
```

**`n` parameter** (find / replace / split): `0` or unset = all, `+n` = first n, `-n` = last n.

---

## 🩹 Changelog

See [docs/CHANGELOG.md](docs/CHANGELOG.md) for the full changelog.

### v4.0.1
- Bundle StringLib (CMDred, MIT) and expose via `macro:lib/string/*`
- Load-time warn if StringLib is missing

### v3.0.3
- New `1_20_5` overlay (pack_format 48)
- `math/mul_div` — overflow-safe a×b÷c

### v3.0.2
- New `1_20_3` overlay (pack_format 26)
- `queue/` multi-cmd system
- Trigger system rewrite

### v3.0 — Bug Fixes & New Modules

| Bug | Fix |
|-----|-----|
| **CRITICAL**: `$epoch` reset on `/reload` | Added `unless score $epoch` guard |
| `process_queue` stack overflow risk | `$pq_depth` limit of 256/tick |

New modules: `math/abs`, `math/clamp`, `team/*`, `config/*`, `lib/input_push`, `lib/input_pop`

---

## 💬 Community & Support

[![Discussions](https://img.shields.io/github/discussions/tickwarden/macroEngine-datapack?style=for-the-badge&logo=github&color=blue)](https://github.com/tickwarden/macroEngine-datapack/discussions)

[GitHub Discussions](https://github.com/tickwarden/macroEngine-datapack/discussions) — For questions, suggestions, and bug reports.


[![Issues](https://img.shields.io/github/issues/tickwarden/macroEngine-datapack?style=for-the-badge)](https://github.com/tickwarden/macroEngine-datapack/issues) - GitHub Issues — Your hub for questions, suggestions, and bug reports.
---

*Advanced Macro Engine v4.0.1 | MC Java 1.20.3–1.21.6+ | Language: mcfunction*
