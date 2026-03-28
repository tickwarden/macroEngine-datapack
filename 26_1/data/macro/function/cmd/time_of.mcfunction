# AME - Universal World Clock Controller
# Usage: /function ame:clock_handler {clock:"macro:test", action:"set", value:"12000"}
$time of $(clock) $(action) $(value)

# System Debug Log for staff (Only for users with 'macro.debug' tag)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"clock/system_update ","color":"aqua"},{"text":"$(clock) ","color":"white"},{"text":"action:","color":"gray"},{"text":"$(action) ","color":"gold"},{"text":"value:","color":"gray"},{"text":"$(value)","color":"yellow"}]