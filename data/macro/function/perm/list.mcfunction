$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Perms: ","color":"aqua"},{"text":"$(player)","color":"white","bold":true},{"text":" ━━━━━━━━━━━━━━","color":"#555555"}]
$execute if data storage macro:engine permissions.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"permissions.$(player)","interpret":false,"color":"yellow"}]
$execute unless data storage macro:engine permissions.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"#555555"},{"text":"(no permissions)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
