setblock -30000000 0 1600 minecraft:test_block[mode=log]{mode:"log",message:"❌ [AME] Version conflict detected. Expected v2.2.2. Run /reload in-game for details."}
setblock -30000000 1 1600 minecraft:redstone_block

tellraw @a ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Version conflict! ","color":"red","bold":true},{"text":"Expected ","color":"#555555"},{"text":"v2.2.2","color":"aqua","bold":true},{"text":" — stored scores do not match.","color":"#555555"}]
tellraw @a ["",{"text":" ","color":"#555555"},{"text":"→ Run ","color":"gray"},{"text":"/reload","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/reload"},"hover_event":{"action":"show_text","value":"Click to reload"}},{"text":" to reinitialize AME.","color":"gray"}]

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"DEBUG ","color":"aqua"},{"text":"ame.pre_version scores → ","color":"#555555"},{"text":"major=","color":"gray"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"yellow"},{"text":" minor=","color":"gray"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"yellow"},{"text":" patch=","color":"gray"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"yellow"},{"text":" (expected: 2 2 0 pre=0)","color":"red"}]

data modify storage macro:input message set value "✘ Version mismatch — expected v2.2.2. Load aborted."
function macro:log/warn with storage macro:input {}
data remove storage macro:input message