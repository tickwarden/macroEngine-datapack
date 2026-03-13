# ============================================
# ame_load:load/internal/version_warn [-1_21_4 overlay]
# ============================================
# Overrides base for pack_format ≤ 61 (≤ 1.21.4).
# Uses legacy clickEvent/hoverEvent syntax.
# ============================================

tellraw @a ["",{"text":"❌ ","color":"red"},{"text":"[AME] ","color":"aqua","bold":true},{"text":"Version conflict! ","color":"red","bold":true},{"text":"Expected ","color":"gray"},{"text":"v2.0.3-pre2","color":"yellow","bold":true},{"text":" — stored scores do not match.","color":"gray"}]
tellraw @a ["",{"text":" ↳ ","color":"#555555"},{"text":"Run ","color":"gray"},{"text":"/reload","color":"white","underlined":true,"clickEvent":{"action":"run_command","value":"/reload"}},{"text":" to reinitialize AME.","color":"gray"}]

tellraw @a[tag=macro.debug] ["",{"text":"[AME/DEBUG] ","color":"aqua"},{"text":"ame.pre_version → ","color":"#555555"},{"text":"$v_major=","color":"gray"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"yellow"},{"text":" $v_minor=","color":"gray"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"yellow"},{"text":" $v_patch=","color":"gray"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"yellow"},{"text":" (expected: 2 0 3 pre=2)","color":"red"}]

data modify storage macro:input message set value "❌ Version mismatch — expected v2.0.3-pre2. Load aborted."
function macro:log/warn with storage macro:input {}
data remove storage macro:input message
