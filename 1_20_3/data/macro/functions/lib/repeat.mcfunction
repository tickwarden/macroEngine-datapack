$data modify storage macro:engine _repeat.func set value "$(func)"
$scoreboard players set $rep_n macro.tmp $(count)
scoreboard players set $rep_i macro.tmp 0
execute store result storage macro:engine _repeat.i int 1 run scoreboard players get $rep_i macro.tmp
execute store result storage macro:engine _repeat.remaining int 1 run scoreboard players get $rep_n macro.tmp
function macro:lib/internal/repeat_run
data remove storage macro:engine _repeat
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/repeat ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]}
