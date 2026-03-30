data modify storage macro:output result set value 0
$execute if data storage macro:engine events.$(event) run execute store result storage macro:output result int 1 run data get storage macro:engine events.$(event)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"event/count ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(event)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
