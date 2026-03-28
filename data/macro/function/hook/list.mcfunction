# macro:hook/list
# Shows all registered hook binds to macro.debug players.

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Hook Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage macro:engine hook_binds[0] run tellraw @a[tag=macro.debug] ["",{"text":"  ","color":"#555555"},{"text":"(no hook binds)","color":"gray","italic":true}]
execute if data storage macro:engine hook_binds[0] run tellraw @a[tag=macro.debug] ["",{"text":"  ","color":"#555555"},{"storage":"macro:engine","nbt":"hook_binds","interpret":false,"color":"yellow"}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
