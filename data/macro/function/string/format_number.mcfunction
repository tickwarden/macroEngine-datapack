# ─────────────────────────────────────────────────────────────────
#  macro:string/format_number
#  Converts large numbers to readable abbreviations.
#  Input : $(value) → integer
#  Output: macro:output text   → abbreviated text (storage string)
#           macro:output value  → original value
#           macro:output suffix → k / M / B / "" suffix
#           macro:output short  → abbreviated integer part
#
#  Examples:
#    500        → "500"
#    1500       → "1.5k"
#    1000000    → "1M"
#    2500000    → "2.5M"
#    1000000000 → "1B"
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $fn_v macro.tmp $(value)
execute store result storage macro:output value int 1 run scoreboard players get $fn_v macro.tmp

# < 1000 → plain number
execute if score $fn_v macro.tmp matches ..999 run data modify storage macro:output suffix set value ""
execute if score $fn_v macro.tmp matches ..999 run execute store result storage macro:output short int 1 run scoreboard players get $fn_v macro.tmp
execute if score $fn_v macro.tmp matches ..999 run return 0

# 1000 – 999999 → k
execute if score $fn_v macro.tmp matches 1000..999999 run data modify storage macro:output suffix set value "k"
execute if score $fn_v macro.tmp matches 1000..999999 run scoreboard players set $fn_div macro.tmp 100
execute if score $fn_v macro.tmp matches 1000..999999 run scoreboard players operation $fn_v macro.tmp /= $fn_div macro.tmp
execute if score $fn_v macro.tmp matches 1000..999999 run execute store result storage macro:output short int 1 run scoreboard players get $fn_v macro.tmp
execute if score $fn_v macro.tmp matches 1000..999999 run return 0

# 1_000_000 – 999_999_999 → M
execute if score $fn_v macro.tmp matches 1000000..999999999 run data modify storage macro:output suffix set value "M"
execute if score $fn_v macro.tmp matches 1000000..999999999 run scoreboard players set $fn_div macro.tmp 100000
execute if score $fn_v macro.tmp matches 1000000..999999999 run scoreboard players operation $fn_v macro.tmp /= $fn_div macro.tmp
execute if score $fn_v macro.tmp matches 1000000..999999999 run execute store result storage macro:output short int 1 run scoreboard players get $fn_v macro.tmp
execute if score $fn_v macro.tmp matches 1000000..999999999 run return 0

# >= 1_000_000_000 → B
execute if score $fn_v macro.tmp matches 1000000000.. run data modify storage macro:output suffix set value "B"
execute if score $fn_v macro.tmp matches 1000000000.. run scoreboard players set $fn_div macro.tmp 100000000
execute if score $fn_v macro.tmp matches 1000000000.. run scoreboard players operation $fn_v macro.tmp /= $fn_div macro.tmp
execute if score $fn_v macro.tmp matches 1000000000.. run execute store result storage macro:output short int 1 run scoreboard players get $fn_v macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/format_number ","color":"aqua"},{"text":"$(value) → ","color":"gray"},{"storage":"macro:output","nbt":"short","color":"green"},{"storage":"macro:output","nbt":"suffix","color":"green"}]
