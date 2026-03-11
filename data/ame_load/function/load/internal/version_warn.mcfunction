# ============================================
# ame_load:load/internal/version_warn
# ============================================
# Called by validate when ame.pre_version scores mismatch.
# After return, validate issues "return 0" → load cancelled.
# ============================================

# ─── Test framework log block ─────────────────────────────
setblock -30000000 0 1600 minecraft:test_block[mode=log]{mode:"log",message:"❌ [AME] Version conflict detected. Expected v2.0.2. Run /reload in-game for details."}
setblock -30000000 1 1600 minecraft:redstone_block

# ─── Broadcast warning ────────────────────────────────────
tellraw @a ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Version conflict! ","color":"red","bold":true},{"text":"Expected ","color":"dark_gray"},{"text":"v2.0.2","color":"aqua","bold":true},{"text":" — stored scores do not match.","color":"dark_gray"}]
tellraw @a ["",{"text":"  ","color":"dark_gray"},{"text":"→ Run ","color":"gray"},{"text":"/reload","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/reload"},"hover_event":{"action":"show_text","value":"Click to reload"}},{"text":" to reinitialize AME.","color":"gray"}]

# ─── Debug channel: current score values ─────────────────
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"DEBUG ","color":"aqua"},{"text":"ame.pre_version scores → ","color":"dark_gray"},{"text":"major=","color":"gray"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"yellow"},{"text":" minor=","color":"gray"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"yellow"},{"text":" patch=","color":"gray"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"yellow"},{"text":" (expected: 2 0 1 pre=0)","color":"red"}]

# ─── AME log buffer (WARN) ────────────────────────────────
data modify storage macro:input message set value "✘ Version mismatch — expected v2.0.2. Load aborted."
function macro:log/warn with storage macro:input {}
data remove storage macro:input message
