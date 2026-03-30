data modify storage macro:output result set value 0b
$execute if data storage macro:engine events.$(event) run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"event/has ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(event)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
