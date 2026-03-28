execute if entity @s[tag=macro.admin] run function macro:perm/trigger/internal/exec with storage macro:engine _ptd_current

$execute unless entity @s[tag=macro.admin] if entity @s[tag=perm.$(perm)] run function macro:perm/trigger/internal/exec with storage macro:engine _ptd_current

$execute unless entity @s[tag=macro.admin] unless entity @s[tag=perm.$(perm)] run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
