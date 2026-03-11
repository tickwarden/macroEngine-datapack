# ============================================
# macro:flag/list
# ============================================
# Shows all active global flags to macro.debug-tagged players.
# INPUT: (yok)
# ============================================

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Global Flags ","color":"aqua"},{"text":"━━━━━━━━━━━","color":"dark_gray"}]
execute if data storage macro:engine flags run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"storage":"macro:engine","nbt":"flags","interpret":false,"color":"white"}]
execute unless data storage macro:engine flags run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"text":"(no active flags)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
