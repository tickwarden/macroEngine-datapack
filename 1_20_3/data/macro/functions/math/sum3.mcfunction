# ─────────────────────────────────────────────────────────────────
#  macro:math/sum3
#  Adds three integers with INT_MAX overflow guard.
#  Input : $(a), $(b), $(c)
#  Output: macro:output result → a + b + c  (clamped to 2147483647)
#
#  Example:
#    data modify storage macro:input a set value 100
#    data modify storage macro:input b set value 200
#    data modify storage macro:input c set value 300
#    function macro:math/sum3 with storage macro:input {}
#    # macro:output result = 600
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $s3_a macro.tmp $(a)
$scoreboard players set $s3_b macro.tmp $(b)
$scoreboard players set $s3_c macro.tmp $(c)

scoreboard players operation $s3_a macro.tmp += $s3_b macro.tmp
# Overflow clamp after first add
execute if score $s3_a macro.tmp matches 2147483647.. run scoreboard players set $s3_a macro.tmp 2147483647

scoreboard players operation $s3_a macro.tmp += $s3_c macro.tmp
# Overflow clamp after second add
execute if score $s3_a macro.tmp matches 2147483647.. run scoreboard players set $s3_a macro.tmp 2147483647

execute store result storage macro:output result int 1 run scoreboard players get $s3_a macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/sum3 ","color":"aqua"},{"text":"($(a)+$(b)+$(c)) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]}
