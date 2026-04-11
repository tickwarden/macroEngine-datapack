$execute if data storage macro:engine once_keys.$(key) run return 0

$data modify storage macro:engine once_keys.$(key) set value 1b

$$(cmd)

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/once_cmd ","color":"aqua"},{"text":"[fired] ","color":"green"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(cmd)","color":"white"}]}
