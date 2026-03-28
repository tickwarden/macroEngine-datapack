# macro:nbt/internal/count_exec [MACRO]
# INPUT: $(storage), $(path)

scoreboard players set $nbt_count macro.tmp 0
$execute store result score $nbt_count macro.tmp run data get storage $(storage) $(path)

execute store result storage macro:output result int 1 run scoreboard players get $nbt_count macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"nbt/count ","color":"aqua"},{"text":"$(storage):$(path)","color":"white"},{"text":" → ","color":"#555555"},{"score":{"name":"$nbt_count","objective":"macro.tmp"},"color":"green"}]
