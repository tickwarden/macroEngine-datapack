data remove storage macro:output result
$execute if data storage macro:engine states.$(player) run data modify storage macro:output result set from storage macro:engine states.$(player)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"state/get ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
