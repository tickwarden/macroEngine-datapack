tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Trigger Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage macro:engine trigger_binds[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(no binds registered)","color":"gray","italic":true}]
execute if data storage macro:engine trigger_binds[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"nbt":"trigger_binds","storage":"macro:engine","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
