# ─────────────────────────────────────────────────────────────────
# macro:string/ordinal
# Determines the English ordinal suffix for a positive integer.
# Handles the 11th/12th/13th exception correctly.
#
#  Input : $(n) → positive integer (1-based)
# Output: macro:output n → original value (int)
# macro:output suffix → "st" / "nd" / "rd" / "th"
#
# To display "3rd place" in chat:
# function macro:string/ordinal {n:3}
# tellraw @a ["",
# {"storage":"macro:output","nbt":"n"},
# {"storage":"macro:output","nbt":"suffix","color":"gold"},
# {"text":" place"}]
#
# Examples:
# {n:1} → suffix="st" {n:11} → suffix="th"
# {n:2} → suffix="nd" {n:12} → suffix="th"
# {n:3} → suffix="rd" {n:13} → suffix="th"
# {n:4} → suffix="th" {n:21} → suffix="st"
# {n:22} → suffix="nd" {n:103}→ suffix="rd"
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $ord_n macro.tmp $(n)
execute store result storage macro:output n int 1 run scoreboard players get $ord_n macro.tmp

# last-two-digits mod 100 (teen detection)
scoreboard players operation $ord_h macro.tmp = $ord_n macro.tmp
scoreboard players set $ord_100 macro.tmp 100
scoreboard players operation $ord_h macro.tmp %= $ord_100 macro.tmp

# last digit mod 10 (suffix selection)
scoreboard players operation $ord_d macro.tmp = $ord_n macro.tmp
scoreboard players set $ord_10 macro.tmp 10
scoreboard players operation $ord_d macro.tmp %= $ord_10 macro.tmp

# Default: th
data modify storage macro:output suffix set value "th"

# Apply last-digit rules
execute if score $ord_d macro.tmp matches 1 run data modify storage macro:output suffix set value "st"
execute if score $ord_d macro.tmp matches 2 run data modify storage macro:output suffix set value "nd"
execute if score $ord_d macro.tmp matches 3 run data modify storage macro:output suffix set value "rd"

# Teen override — 11, 12, 13 must always be "th"
execute if score $ord_h macro.tmp matches 11..13 run data modify storage macro:output suffix set value "th"

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/ordinal ","color":"aqua"},{"text":"$(n)","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"suffix","color":"green"}]
