execute if score #ame.pre ame.pre_version matches 1.. run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"ready · ame.pre_version → ","color":"#555555"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua"},{"text":".","color":"#555555"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua"},{"text":".","color":"#555555"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua"},{"text":"-pre","color":"#ff8800"},{"score":{"name":"#ame.pre","objective":"ame.pre_version"},"color":"#ff8800"}]
execute if score #ame.pre ame.pre_version matches ..0 run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"ready · ame.pre_version → ","color":"#555555"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua"},{"text":".","color":"#555555"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua"},{"text":".","color":"#555555"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua"}]

execute if score #ame.pre ame.pre_version matches 1.. run tellraw @a ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"v","color":"aqua"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":"-pre","color":"#ff8800"},{"score":{"name":"#ame.pre","objective":"ame.pre_version"},"color":"#ff8800","bold":true},{"text":" loaded.","color":"green"}]
execute if score #ame.pre ame.pre_version matches ..0 run tellraw @a ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"v","color":"aqua"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":" loaded.","color":"green"}]

data modify storage macro:input message set value "✔ All modules initialized. Engine ready."
data modify storage macro:input level set value "AME"
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}
data remove storage macro:input message
data remove storage macro:input level
data remove storage macro:input color

# Send Debug Message
summon minecraft:marker 0 -64 0 {Tags:["ame.done"],CustomName:{text:"AME/Load",italic:0b,color:"gold",bold:1b}}
execute as @e[type=minecraft:marker,limit=1,tag=ame.done] run say Done...
kill @e[type=minecraft:marker,tag=ame.done]