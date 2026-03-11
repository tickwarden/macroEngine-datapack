# ============================================
# macro:event/list
# ============================================
# Shows all registered events and handlers on the debug channel.
# INPUT: (yok)
# ============================================

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Registered Events ","color":"aqua"},{"text":"━━━━━━","color":"dark_gray"}]
execute if data storage macro:engine events run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"storage":"macro:engine","nbt":"events","interpret":false,"color":"yellow"}]
execute unless data storage macro:engine events run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"text":"(no registered events)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
