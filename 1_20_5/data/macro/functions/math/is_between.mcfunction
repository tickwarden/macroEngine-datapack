# ─────────────────────────────────────────────────────────────────
# macro:math/is_between
# Checks if value is in the inclusive range [min, max].
#  Input : $(value), $(min), $(max)
# Output: macro:output result → 1b (true) or 0b (false)
#
# Example:
# data modify storage macro:input value set value 15
# data modify storage macro:input min set value 10
# data modify storage macro:input max set value 20
# function macro:math/is_between with storage macro:input {}
# # macro:output result = 1b
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $ib_v macro.tmp $(value)
$scoreboard players set $ib_lo macro.tmp $(min)
$scoreboard players set $ib_hi macro.tmp $(max)

data modify storage macro:output result set value 0b

execute if score $ib_v macro.tmp >= $ib_lo macro.tmp run execute if score $ib_v macro.tmp <= $ib_hi macro.tmp run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/is_between ","color":"aqua"},{"text":"$(value) in [$(min),$(max)] → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]}
