tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Active Schedules ","color":"aqua"},{"text":"━━━━━━━━━","color":"#555555"}]
execute if data storage macro:engine schedules run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"schedules","interpret":false,"color":"gold"}]
execute unless data storage macro:engine schedules run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"#555555"},{"text":"(no active schedules)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
