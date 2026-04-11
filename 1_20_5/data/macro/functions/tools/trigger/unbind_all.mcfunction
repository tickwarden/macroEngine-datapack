# Admin-protected trigger/unbind_all. Takes no arguments.
execute unless function macro:tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

function macro:trigger/unbind_all
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"⚠ ","color":"yellow"},{"text":"trigger/unbind_all ","color":"aqua"},{"text":"all binds cleared","color":"#555555"}]
