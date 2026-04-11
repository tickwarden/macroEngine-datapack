# Admin-protected trigger/unbind.
# Usage: {value:1}
execute unless function macro:tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function macro:trigger/unbind {value:$(value)}
$tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"trigger/unbind ","color":"aqua"},{"text":"value=","color":"#555555"},{"text":"$(value)","color":"white"},{"text":" removed","color":"#555555"}]
