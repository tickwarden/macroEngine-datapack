execute unless function macro:tools/utils/check_all run return run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$tag $(NAME) add macro.admin
$tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"$(NAME)","color":"white"},{"text":" added as admin.","color":"green"}]
