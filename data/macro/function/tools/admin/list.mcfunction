execute unless function macro:tools/utils/check_all run return 0

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Admin List ","color":"aqua"},{"text":"━━━━━━━━━━━━━━","color":"#555555"}]
execute if entity @a[tag=macro.admin] run tellraw @s ["",{"text":"  ◈ ","color":"#00AAAA"},{"selector":"@a[tag=macro.admin]","color":"white"}]
execute unless entity @a[tag=macro.admin] run tellraw @s ["",{"text":"  ","color":"#555555"},{"text":"(no admins)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
