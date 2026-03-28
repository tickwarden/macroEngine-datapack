$data modify storage macro:engine event_context.player set value "$(player)"

function macro:event/fire with storage macro:input {}

data remove storage macro:engine event_context.player

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"event/fire_as ","color":"aqua"},{"text":"$(event)","color":"aqua"},{"text":" as ","color":"#555555"},{"text":"$(player)","color":"white"}]
