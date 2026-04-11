# Admin-protected trigger/bind. Wraps macro:trigger/bind.
# Usage: {value:1, func:"ns:path"}
execute unless function macro:tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function macro:trigger/bind {value:$(value), func:"$(func)"}
$tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"trigger/bind ","color":"aqua"},{"text":"$(value)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
