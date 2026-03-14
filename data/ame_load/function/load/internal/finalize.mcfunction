setblock -30000000 0 1601 minecraft:test_block[mode=log]{mode:"log",message:"✅ [AME] v2.0.3-pre4 loaded successfully."}
setblock -30000000 1 1601 minecraft:redstone_block

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"v2.0.3-pre4 ","color":"aqua","bold":true},{"text":"ready ","color":"green"},{"text":"· ame.pre_version → ","color":"#555555"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua"},{"text":".","color":"#555555"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua"},{"text":".","color":"#555555"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua"}]

tellraw @a ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"v2.0.3-pre4 ","color":"aqua"},{"text":"loaded.","color":"green"}]

data modify storage macro:input message set value "✔ All modules initialized. Engine ready."
data modify storage macro:input level set value "AME"
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}
data remove storage macro:input message
data remove storage macro:input level
data remove storage macro:input color

setblock -30000000 0 1601 minecraft:air
setblock -30000000 1 1601 minecraft:air
