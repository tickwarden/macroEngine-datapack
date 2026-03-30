$scoreboard players set $rn_n macro.tmp $(n)
scoreboard players set $rn_i macro.tmp 0

execute if score $rn_n macro.tmp matches ..0 run return 0

$data modify storage macro:engine _rn_func set value "$(func)"
function macro:lib/internal/repeat_n_loop
data remove storage macro:engine _rn_func
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/repeat_n ","color":"aqua"},{"text":"$(func) × $(n)","color":"aqua"}]}
