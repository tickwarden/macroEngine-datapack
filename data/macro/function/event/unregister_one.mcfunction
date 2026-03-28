$execute unless data storage macro:engine events.$(event) run return 0

$data modify storage macro:engine _uro.event set value "$(event)"
$data modify storage macro:engine _uro.func set value "$(func)"
$data modify storage macro:engine _uro.src set from storage macro:engine events.$(event)

$data remove storage macro:engine events.$(event)

execute if data storage macro:engine _uro.src[0] run function macro:event/internal/uro_loop

data remove storage macro:engine _uro
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"event/unregister_one ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
