tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"aqua","bold":true},{"text":"v2.0.3-pre4 ","color":"green","bold":true},{"text":"ready · ame.pre_version → ","color":"#555555"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"yellow"},{"text":".","color":"#555555"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"yellow"},{"text":".","color":"#555555"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"yellow"}]

data modify storage macro:input message set value "✅ All modules initialized. Engine ready."
data modify storage macro:input level set value "AME"
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}
data remove storage macro:input message
data remove storage macro:input level
data remove storage macro:input color
