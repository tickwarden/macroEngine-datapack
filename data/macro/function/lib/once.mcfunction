$execute if data storage macro:engine once_keys.$(key) run return 0

$data modify storage macro:engine once_keys.$(key) set value 1b

$function $(func)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/once ","color":"aqua"},{"text":"[fired] ","color":"green"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"white"}]
