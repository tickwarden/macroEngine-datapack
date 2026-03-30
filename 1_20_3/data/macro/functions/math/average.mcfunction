# ─────────────────────────────────────────────────────────────────
#  macro:math/average
#  Computes the integer average of up to 8 values.
#  Input : $(v0)..(v7)  → integer values
#          $(count)     → how many values (1-8)
#  Output: macro:output result → floor(sum / count)
#
#  Example:
#    data modify storage macro:input v0 set value 10
#    data modify storage macro:input v1 set value 20
#    data modify storage macro:input v2 set value 30
#    data modify storage macro:input count set value 3
#    function macro:math/average with storage macro:input {}
#    # macro:output result = 20
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $avg_c macro.tmp $(count)

execute if score $avg_c macro.tmp matches ..0 run data modify storage macro:output result set value 0
execute if score $avg_c macro.tmp matches ..0 run return 0

$scoreboard players set $avg_s macro.tmp $(v0)
$execute if score $avg_c macro.tmp matches 2.. run scoreboard players add $avg_s macro.tmp $(v1)
$execute if score $avg_c macro.tmp matches 3.. run scoreboard players add $avg_s macro.tmp $(v2)
$execute if score $avg_c macro.tmp matches 4.. run scoreboard players add $avg_s macro.tmp $(v3)
$execute if score $avg_c macro.tmp matches 5.. run scoreboard players add $avg_s macro.tmp $(v4)
$execute if score $avg_c macro.tmp matches 6.. run scoreboard players add $avg_s macro.tmp $(v5)
$execute if score $avg_c macro.tmp matches 7.. run scoreboard players add $avg_s macro.tmp $(v6)
$execute if score $avg_c macro.tmp matches 8.. run scoreboard players add $avg_s macro.tmp $(v7)

scoreboard players operation $avg_s macro.tmp /= $avg_c macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $avg_s macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/average ","color":"aqua"},{"text":"count=$(count) ","color":"gray"},{"text":"→ ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
