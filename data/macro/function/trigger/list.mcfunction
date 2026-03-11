# ============================================
# macro:trigger/list
# ============================================
# Shows registered trigger binds to @s.
# USAGE: execute as <player> run function macro:trigger/list
# ============================================

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Trigger Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━","color":"dark_gray"}]
execute unless data storage macro:engine trigger_binds[0] run tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"(no binds registered)","color":"gray","italic":true}]
execute if data storage macro:engine trigger_binds[0] run tellraw @s ["",{"text":" ","color":"dark_gray"},{"nbt":"trigger_binds","storage":"macro:engine","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
