setblock -30000000 0 1600 minecraft:test_block[mode=log]{mode:"log",message:"❌ [AME] Version conflict detected. Expected v2.2.1. Run /reload in-game for details."}

tellraw @a ["",{"text":"❌ ","color":"red"},{"text":"[AME] ","color":"aqua","bold":true},{"text":"Version conflict! ","color":"red","bold":true},{"text":"Expected ","color":"gray"},{"text":"v2.2.1","color":"yellow","bold":true},{"text":" — stored scores do not match.","color":"gray"}]
tellraw @a ["",{"text":" ↳ ","color":"#555555"},{"text":"Run ","color":"gray"},{"text":"/reload","color":"white","underlined":true,"click_event":{"action":"run_command","command":"/reload"}},{"text":" to reinitialize AME.","color":"gray"}]

tellraw @a[tag=macro.debug] ["",{"text":"[AME/DEBUG] ","color":"aqua"},{"text":"ame.pre_version → ","color":"#555555"},{"text":"$v_major=","color":"gray"},{"score":{"name":"$v_major","objective":"ame.pre_version"},"color":"yellow"},{"text":" $v_minor=","color":"gray"},{"score":{"name":"$v_minor","objective":"ame.pre_version"},"color":"yellow"},{"text":" $v_patch=","color":"gray"},{"score":{"name":"$v_patch","objective":"ame.pre_version"},"color":"yellow"},{"text":" (expected: 2 2 0 pre=0)","color":"red"}]

data modify storage macro:input message set value "❌ Version mismatch — expected v2.2.1. Load aborted."
function macro:log/warn with storage macro:input {}
data remove storage macro:input message
