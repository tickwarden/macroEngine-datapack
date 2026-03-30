$data modify storage macro:engine _felist_state set value {func:"$(func)"}
scoreboard players set $felist_i macro.tmp 0
function macro:lib/internal/for_each_list_step

data remove storage macro:engine _felist_input
data remove storage macro:engine _felist_state
data remove storage macro:engine _felist_current
data remove storage macro:engine _felist_i
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/for_each_list ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]}
