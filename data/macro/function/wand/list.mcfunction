# macro:wand/list — Shows registered wand binds.
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Wand Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage macro:engine wand_binds[0] run tellraw @s ["",{"text":"  ","color":"#555555"},{"text":"(no wand binds)","color":"gray","italic":true}]
execute if data storage macro:engine wand_binds[0] run tellraw @s ["",{"text":"  ","color":"#555555"},{"storage":"macro:engine","nbt":"wand_binds","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
