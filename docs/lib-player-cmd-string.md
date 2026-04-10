# 🔁 Library · 👤 Player · ⚙️ Commands · 💬 Messaging & Dialog System

← [Back to README](docs/README.md)

---

## 🔁 Library Module — `macro:lib/*`

This module contains essential utility functions used throughout the Advanced Macro Engine.

| Function                    | Input Parameters                          | Description |
|----------------------------|-------------------------------------------|-----------|
| `lib/for_each_player`      | `func` (string)                           | Executes the specified function **as each online player**. |
| `lib/for_each_player_at`   | `func` (string)                           | Executes the function **as each player at their current location**. |
| `lib/repeat`               | `func`, `count` (int)                     | Repeats a function a specific number of times. |
| `lib/wait`                 | `func`, `delay` (int, ticks)              | Schedules a function to run after a delay (shortcut for queue system). |
| `lib/input_push`           | —                                         | Saves the current state of `macro:input` storage. |
| `lib/input_pop`            | —                                         | Restores the previously saved `macro:input` state. |
| `lib/for_each_list`        | `func` + `macro:engine _felist_input` list | Iterates over a list and runs the function for each entry with macro expansion. |

### Detailed Examples

```mcfunction
# Give every online player a daily reward
data modify storage macro:input func set value "mypack:daily/reward"
function macro:lib/for_each_player with storage macro:input {}

# Spawn 10 mobs with 1 tick delay between each
data modify storage macro:input func set value "mypack:mobs/spawn_zombie"
data modify storage macro:input count set value 10
function macro:lib/repeat with storage macro:input {}

# Delayed message
data modify storage macro:input func set value "mypack:announce/event_start"
data modify storage macro:input delay set value 60
function macro:lib/wait with storage macro:input {}
```

---

## 👤 Player Management — `macro:player/*`

| Function                | Input                              | Description |
|------------------------|------------------------------------|-----------|
| `player/reset`         | `player` (name)                    | **Dangerous** — Completely resets all player data, variables, and cooldowns. |
| `player/list_vars`     | `player` (name)                    | Displays all stored variables and cooldowns for the player. |
| `player/add_default`   | `player`, `key`, `value`           | Sets a default value only if the key does not already exist. |
| `player/increment`     | `player`, `key`                    | Increases the player's variable by 1. |
| `player/decrement`     | `player`, `key`                    | Decreases the player's variable by 1. |

---

## ⚙️ Command API — `macro:cmd/*`

A rich set of safe, macro-friendly commands.

| Function                        | Input Parameters                              | Description |
|--------------------------------|-----------------------------------------------|-----------|
| `cmd/kill`                     | `player`                                      | Kills the target player. |
| `cmd/damage`                   | `player`, `amount`, `type`                    | Deals custom damage with damage type. |
| `cmd/damage_typed`             | `player`, `amount`, `damage_type`             | Uses custom damage types (e.g. `macro:true_damage`). |
| `cmd/heal`                     | `player`, `amount`                            | Heals using instant_health effect. |
| `cmd/actionbar`                | `player`, `text`, `color`                     | Sends an actionbar message. |
| `cmd/clear`                    | `player`                                      | Clears entire inventory. |
| `cmd/clear_item`               | `player`, `item`, `count`                     | Removes specific item. |
| `cmd/give`                     | `player`, `item`, `count`                     | Gives items to player. |
| `cmd/gamemode`                 | `player`, `mode`                              | Changes gamemode. |
| `cmd/effect_give`              | `player`, `effect`, `duration`, `amplifier`   | Applies status effects. |
| `cmd/bossbar_add`              | `id`, `text`, `color`                         | Creates a bossbar. |
| `cmd/particle`                 | Multiple (name, pos, delta, speed, count)     | Spawns particle effects. |
| `cmd/tag_add` / `tag_remove`   | `player`, `tag`                               | Manages entity tags. |
| `cmd/scoreboard_set`           | `player`, `objective`, `value`                | Sets scoreboard value. |

**Admin Commands** (require `macro.admin` tag + creative + overworld):
- `cmd/ban`, `cmd/kick`, `cmd/op`, `cmd/deop`, `cmd/ban_ip`, etc.

---

## 💬 Messaging System — `macro:string/*`

Advanced text and interaction system with click/hover support.

| Function                     | Input Parameters                                      | Description |
|-----------------------------|-------------------------------------------------------|-----------|
| `string/chat`               | `target`, `message`, `color`                          | Simple colored chat message. |
| `string/player_raw`         | `player`, `json`                                      | Raw JSON message to one player. |
| `string/broadcast_raw`      | `json`                                                | Raw JSON to all players. |
| `string/click_run`          | `target`, `text`, `color`, `command`                  | Clickable text that runs a command. |
| `string/click_suggest`      | `target`, `text`, `color`, `suggest`                  | Click to suggest command in chat. |
| `string/copy_to_clipboard`  | `target`, `text`, `color`, `copy_value`               | Click to copy text to clipboard. |
| `string/link`               | `target`, `text`, `color`, `url`                      | Clickable hyperlink. |
| `string/hover_text`         | `target`, `text`, `color`, `hover`, `hover_color`     | Text with hover tooltip. |
| `string/tooltip_item`       | `target`, `text`, `color`, `item`                     | Shows item preview on hover. |
| `string/function_suggest`   | `target`, `title`, `body`, `suggest`, `color`         | Beautiful function suggestion button. |
| `string/progress_bar`       | `player`, `current`, `max`, `label`                   | Visual progress bar in actionbar. |

---

## 🗨️ Dialog System (Native 1.21.6+)

**Fully supported in 1.21.6+** with native Minecraft dialog UI.

### Main Functions

| Function           | Parameters              | Description |
|--------------------|-------------------------|-----------|
| `dialog/load`      | `cooldown` (optional, default 20) | **No required parameters** — Prepares and starts cooldown for dialog. |
| `dialog/open`      | —                       | Opens the currently stored dialog from `macro:engine dialog.DIALOG`. |
| `dialog/close`     | — (**No parameters**)   | Immediately closes any open dialog for the player. |
| `dialog/show`      | —                       | Internal function — shows dialog using native `dialog show` command. |

### Example — Control Panel Dialog

```mcfunction
# 1. Define the dialog
data modify storage macro:engine dialog.DIALOG set value {
  "type": "multi_action",
  "title": "System Control Panel",
  "body": {
    "type": "plain_message",
    "contents": {
      "text": "Enter the system you want to toggle and press 'Apply'.",
      "color": "aqua"
    }
  },
  "inputs": [
    {
      "type": "minecraft:text",
      "key": "sys",
      "label": "Module / System",
      "max_length": 400000000
    }
  ],
  "actions": [
    {
      "label": "Apply",
      "action": {
        "type": "minecraft:dynamic/run_command",
        "template": "/function macro:flag/toggle_system {system:\"$(sys)\"}"
      }
    }
  ]
}

# 2. Open the dialog
function macro:dialog/load
function macro:dialog/open
```

**Close dialog anytime:**
```mcfunction
function macro:dialog/close
```

---

## Additional Major Features

- **Multi-Command System** (`macro:cmd/other/multi_cmd`): Advanced command lists with conditions, priority sorting, spread execution over ticks, pre/post hooks, and profiling.
- **Wand System**: Bind functions or commands to right-clicking custom items (carrot_on_a_stick or any item) with per-player cooldowns.
- **Hook System**: Powerful event system (player death, block break, dimension change, trade, jump, sneak, etc.).
- **Trigger System**: Custom `macro_action` trigger with easy bind/unbind.
- **UUID System**: Store, cache, compare, and retrieve player/entity UUIDs safely.
- **World & Time Tools**: Accurate time phase detection, custom clocks (1.26.1+), predicates.
- **Logging System**: Structured logs with levels and display command.
- **Permission System**: Tag-based admin system with safe command wrappers.
- **Queue & Fiber**: Reliable task scheduling and lightweight coroutines.

---

**Pack Version**: v3.0.2  
**Compatible with**: Minecraft 1.20.3 → 1.21.x → 26.x+  
**Author**: tickwarden (ToolkitMC)