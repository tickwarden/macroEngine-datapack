# ─────────────────────────────────────────────────────────────────
# macro:math/sign_nonzero
# Returns -1 for negative, +1 for zero-or-positive.
# Useful when you need a non-zero multiplier (e.g. direction vectors).
#
# INPUT : $(value) → integer
# OUTPUT: macro:output result → 1 or -1
#
# EXAMPLE:
#   function macro:math/sign_nonzero {value:-5}
#   → macro:output result = -1
#   function macro:math/sign_nonzero {value:0}
#   → macro:output result = 1
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $snz_v macro.tmp $(value)
data modify storage macro:output result set value 1
execute if score $snz_v macro.tmp matches ..-1 run data modify storage macro:output result set value -1
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/sign_nonzero ","color":"aqua"},{"text":"$(value) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
