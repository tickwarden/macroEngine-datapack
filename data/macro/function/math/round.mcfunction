# ─────────────────────────────────────────────────────────────────
# macro:math/round
# Rounds a value to the nearest multiple of a given step.
# Integer division truncates; adding half the step before dividing
# gives standard rounding (0.5 rounds up).
#
# INPUT : $(value) → integer to round
#         $(step)  → rounding step (must be > 0)
# OUTPUT: macro:output result → rounded value
#
# EXAMPLE:
#   function macro:math/round {value:37, step:10}
#   → macro:output result = 40
#   function macro:math/round {value:34, step:10}
#   → macro:output result = 30
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $rnd_v macro.tmp $(value)
$scoreboard players set $rnd_s macro.tmp $(step)

execute if score $rnd_s macro.tmp matches ..0 run return fail

# add half step for rounding
scoreboard players operation $rnd_half macro.tmp = $rnd_s macro.tmp
scoreboard players set $rnd_2 macro.tmp 2
scoreboard players operation $rnd_half macro.tmp /= $rnd_2 macro.tmp

execute if score $rnd_v macro.tmp matches 0.. run scoreboard players operation $rnd_v macro.tmp += $rnd_half macro.tmp
execute if score $rnd_v macro.tmp matches ..-1 run scoreboard players operation $rnd_v macro.tmp -= $rnd_half macro.tmp

scoreboard players operation $rnd_v macro.tmp /= $rnd_s macro.tmp
scoreboard players operation $rnd_v macro.tmp *= $rnd_s macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $rnd_v macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/round ","color":"aqua"},{"text":"$(value) step=$(step) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
