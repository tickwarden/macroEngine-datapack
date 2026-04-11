# Admin-protected trigger/enable.
# Usage: {player:"Name"}
execute unless function macro:tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function macro:trigger/enable {player:"$(player)"}
$tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"trigger/enable ","color":"aqua"},{"text":"$(player)","color":"white"}]
