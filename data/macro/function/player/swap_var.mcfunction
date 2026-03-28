$data modify storage macro:engine _swap.tmp set from storage macro:engine players.$(player_a).$(key)
$data modify storage macro:engine players.$(player_a).$(key) set from storage macro:engine players.$(player_b).$(key)
$data modify storage macro:engine players.$(player_b).$(key) set from storage macro:engine _swap.tmp
data remove storage macro:engine _swap
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/swap_var ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
