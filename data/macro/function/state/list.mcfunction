# ============================================
# macro:state/list
# ============================================
# Shows all player states to macro.debug-tagged players.
# INPUT: (yok)
# ============================================

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Player States ","color":"aqua"},{"text":"━━━━━━━━━━","color":"dark_gray"}]
execute if data storage macro:engine states run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"storage":"macro:engine","nbt":"states","interpret":false,"color":"white"}]
execute unless data storage macro:engine states run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"text":"(no active states)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
