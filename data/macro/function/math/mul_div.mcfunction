# ─────────────────────────────────────────────────────────────────
# macro:math/mul_div
# Computes floor(a * b / c) without 32-bit integer overflow.
# Uses the identity: floor(a*b/c) = (a/c)*b + (a%c)*b/c
# This avoids overflow when a*b would exceed ±2147483647.
#  Input : $(a), $(b), $(c)   → integers; c must not be 0
# Output: macro:output result → floor(a * b / c)
#
# Note: if (a % c) * b still overflows (e.g. huge b with c=1),
#       the result is clamped by Java's 32-bit signed wrapping.
#       For those cases, reduce inputs before calling.
#
# Example:
# data modify storage macro:input a set value 1000000
# data modify storage macro:input b set value 1000000
# data modify storage macro:input c set value 500000
# function macro:math/mul_div with storage macro:input {}
# # macro:output result = 2000000
# ─────────────────────────────────────────────────────────────────

$scoreboard players set $md_a macro.tmp $(a)
$scoreboard players set $md_b macro.tmp $(b)
$scoreboard players set $md_c macro.tmp $(c)

# Guard: c = 0 → undefined, return 0
execute if score $md_c macro.tmp matches 0 run data modify storage macro:output result set value 0
execute if score $md_c macro.tmp matches 0 run return 0

# q = a / c  (integer quotient)
scoreboard players operation $md_q macro.tmp = $md_a macro.tmp
scoreboard players operation $md_q macro.tmp /= $md_c macro.tmp

# r = a % c  (remainder, Java truncated — may be negative)
scoreboard players operation $md_r macro.tmp = $md_a macro.tmp
scoreboard players operation $md_r macro.tmp %= $md_c macro.tmp

# result = q * b  +  r * b / c
scoreboard players operation $md_q macro.tmp *= $md_b macro.tmp
scoreboard players operation $md_r macro.tmp *= $md_b macro.tmp
scoreboard players operation $md_r macro.tmp /= $md_c macro.tmp
scoreboard players operation $md_q macro.tmp += $md_r macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $md_q macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/mul_div ","color":"aqua"},{"text":"($(a)*$(b)/$(c)) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
