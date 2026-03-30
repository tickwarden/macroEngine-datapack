data remove storage macro:output result
$data modify storage macro:output result set from entity @a[name=$(player),limit=1] Dimension
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/get_dimension ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
