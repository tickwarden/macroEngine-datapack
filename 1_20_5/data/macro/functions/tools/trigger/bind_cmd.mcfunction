# Admin-protected trigger/bind_cmd.
# Usage: {value:1, cmd:"say hello"}
execute unless function macro:tools/utils/check_all run return run \
 tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$function macro:trigger/bind_cmd {value:$(value), cmd:"$(cmd)"}
$tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✔ ","color":"green"},{"text":"trigger/bind_cmd ","color":"aqua"},{"text":"$(value)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(cmd)","color":"aqua"}]
