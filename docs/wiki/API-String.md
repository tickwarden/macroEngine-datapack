# 🔤 String — `macro:string/*` · `macro:lib/string/*`

← [Home](Home)

---

## Text Components — `macro:string/*`

Functions for building formatted chat messages, actionbars, and titles.

| Function | Input | Description |
|----------|-------|-------------|
| `string/actionbar` | `{player, text, color}` | Send actionbar to a player |
| `string/progress_bar` | `{player, cur, max, label, color}` | Render `█░` progress bar in actionbar |
| `string/hover_text` | `{text, color, hover}` | Text with hover tooltip |
| `string/tooltip_item` | `{text, color, item}` | Text with item hover card |
| `string/score_display` | `{player, objective, color}` | Display scoreboard value in chat |
| `string/truncate` | `{player, text, suffix, truncated}` | Send text to actionbar, appending suffix if truncated |
| `string/pluralize` | `{count, singular, plural}` | Return correct singular/plural form |
| `string/format_ticks` | `{ticks}` | Convert ticks → `{minutes, seconds}` |
| `string/repeat` | `{char, count}` | Repeat a single character N times (1–16) |
| `string/disable` | — | Clear actionbar for `@s` |

> **1.21.5+ syntax:** `click_event` / `hover_event` (snake_case). All string functions use the correct syntax for your Minecraft version via overlays.

---

## StringLib Integration — `macro:lib/string/*`

[StringLib (CMDred, MIT)](https://github.com/CMDred/StringLib) is bundled directly. Access via `macro:lib/string/*` wrappers.

All functions read from `macro:input` and write to `macro:output string.result`.

| Function | Input fields | Output |
|----------|-------------|--------|
| `lib/string/concat` | `list` (string array) | Combined string |
| `lib/string/find` | `string`, `find`, `n` | Index list, or `[-1]` |
| `lib/string/replace` | `string`, `find`, `replace`, `n` | Modified string |
| `lib/string/split` | `string`, `separator`, `n`, `keep_empty` | String list |
| `lib/string/insert` | `string`, `insertion`, `index` | Modified string |
| `lib/string/to_lowercase` | `string` | Lowercase (A–Z only, fast) |
| `lib/string/to_lowercase_full` | `string` | Lowercase (full Unicode) |
| `lib/string/to_uppercase` | `string` | Uppercase (a–z only, fast) |
| `lib/string/to_uppercase_full` | `string` | Uppercase (full Unicode) |
| `lib/string/to_number` | `string` | Numeric NBT value |
| `lib/string/to_string` | `value` | String representation |

**`n` parameter** (find / replace / split): `0` or unset = all, `+n` = first n, `-n` = last n.

---

## Examples

### Actionbar progress bar

```mcfunction
# Display HP bar: Steve at 15/20 HP
data modify storage macro:input player set value "Steve"
data modify storage macro:input cur set value 15
data modify storage macro:input max set value 20
data modify storage macro:input label set value "HP"
data modify storage macro:input color set value "red"
function macro:string/progress_bar with storage macro:input {}
```

### Clickable announcement

```mcfunction
data modify storage macro:input text set value "Click to join the arena!"
data modify storage macro:input color set value "gold"
data modify storage macro:input cmd set value "mypack_actions set 1"
function macro:string/click_run with storage macro:input {}
```

### StringLib replace

```mcfunction
data modify storage macro:input string set value "Hello World"
data modify storage macro:input find set value "World"
data modify storage macro:input replace set value "Everyone"
function macro:lib/string/replace with storage macro:input {}
# macro:output string.result → "Hello Everyone"
```

### StringLib split

```mcfunction
data modify storage macro:input string set value "a,b,c,d"
data modify storage macro:input separator set value ","
data modify storage macro:input n set value 0
function macro:lib/string/split with storage macro:input {}
# macro:output string.result → ["a","b","c","d"]
```

### Check if StringLib is loaded

```mcfunction
execute if score StringLib load.status matches 1.. run say StringLib OK
```

> StringLib load is checked at pack load time. If missing, a warning is shown to `macro.debug` players.
