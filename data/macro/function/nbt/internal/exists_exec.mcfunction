# macro:nbt/internal/exists_exec [MACRO]
# INPUT: $(storage), $(path)

data modify storage macro:output result set value 0b
$execute if data storage $(storage) $(path) run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"nbt/exists ","color":"aqua"},{"text":"$(storage):$(path)","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
