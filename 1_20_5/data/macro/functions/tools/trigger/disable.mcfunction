# Admin-protected trigger/disable.
# Usage: {player:"Name"}
execute unless function macro:tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function macro:trigger/disable {player:"$(player)"}
$tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"· ","color":"#555555"},{"text":"trigger/disable ","color":"aqua"},{"text":"$(player)","color":"white"}]
