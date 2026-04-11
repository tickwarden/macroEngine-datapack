data modify storage macro:output result set value 0b
$execute if data storage macro:engine players.$(player).$(key) run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/has_var ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
