execute unless function macro:tools/utils/check_all run return run tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]}

$execute if entity @s[tag=macro.admin] run tag @a[nane=$(target),limit=1] add macro.admin
$tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"$(NAME)","color":"white"},{"text":" added as admin.","color":"green"}]}
