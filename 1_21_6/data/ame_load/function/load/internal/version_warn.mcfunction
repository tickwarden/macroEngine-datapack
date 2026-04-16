tellraw @a ["",{"text":"❌ ","color":"red"},{"text":"[AME] ","color":"aqua","bold":true},{"text":"Version conflict! ","color":"red","bold":true},{"text":"Expected ","color":"gray"},{"text":"v4.0.1","color":"yellow","bold":true},{"text":" — stored scores do not match.","color":"gray"}]
tellraw @a ["",{"text":" ↳ ","color":"#555555"},{"text":"Run ","color":"gray"},{"text":"/reload","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/reload"}},{"text":" to reinitialize AME.","color":"gray"}]

tellraw @a[tag=macro.debug] ["",{"text":"[AME/DEBUG] ","color":"aqua"},{"text":"ame.pre_version → ","color":"#555555"},{"text":"major=","color":"gray"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"yellow"},{"text":" minor=","color":"gray"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"yellow"},{"text":" patch=","color":"gray"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"yellow"},{"text":" pre=","color":"gray"},{"score":{"name":"#ame.pre","objective":"ame.pre_version"},"color":"yellow"},{"text":" (expected: 4 0 1 pre=0)","color":"red"}]

data modify storage macro:input message set value "❌ Version mismatch — expected v4.0.1. Load aborted."
function macro:log/warn with storage macro:input {}
data remove storage macro:input message