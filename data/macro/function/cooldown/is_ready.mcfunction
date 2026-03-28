$data modify storage macro:input player set value "$(player)"
$data modify storage macro:input key set value "$(key)"
function macro:cooldown/check with storage macro:input {}
# check: result=0b → cooldown active. is_ready returns the inverse.
execute if data storage macro:output {result:0b} run data modify storage macro:output result set value 1b
execute if data storage macro:output {result:1b} run data modify storage macro:output result set value 0b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/is_ready ","color":"aqua"},{"text":"$(player):$(key) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
