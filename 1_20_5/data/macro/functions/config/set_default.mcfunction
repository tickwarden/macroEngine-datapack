data modify storage macro:output result set value 1b

$execute if data storage macro:engine config.$(key) run data modify storage macro:output result set value 0b
$execute if data storage macro:engine config.$(key) run return 0

$data modify storage macro:engine config.$(key) set value "$(value)"
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"config/set_default ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
