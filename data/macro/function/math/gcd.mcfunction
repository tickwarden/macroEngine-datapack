# ─────────────────────────────────────────────────────────────────
#  macro:math/gcd
#  Computes GCD using the Euclidean algorithm.
#  Input : $(a), $(b)          → integers (may be negative)
#  Output: macro:output result → GCD(|a|, |b|)
#
#  Example:
#    data modify storage macro:input a set value 48
#    data modify storage macro:input b set value 18
#    function macro:math/gcd with storage macro:input {}
#    # macro:output result = 6
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $gcd_a macro.tmp $(a)
$scoreboard players set $gcd_b macro.tmp $(b)

# Take absolute value
scoreboard players set $gcd_neg macro.tmp -1
execute if score $gcd_a macro.tmp matches ..-1 run scoreboard players operation $gcd_a macro.tmp *= $gcd_neg macro.tmp
execute if score $gcd_b macro.tmp matches ..-1 run scoreboard players operation $gcd_b macro.tmp *= $gcd_neg macro.tmp

# b=0 → result is a
execute if score $gcd_b macro.tmp matches 0 run execute store result storage macro:output result int 1 run scoreboard players get $gcd_a macro.tmp
execute if score $gcd_b macro.tmp matches 0 run return 0

# Euclidean loop (inner function)
function macro:math/internal/gcd_loop

execute store result storage macro:output result int 1 run scoreboard players get $gcd_a macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/gcd ","color":"aqua"},{"text":"($(a),$(b)) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
