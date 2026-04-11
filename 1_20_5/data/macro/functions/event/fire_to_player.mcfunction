$execute unless data storage macro:engine events.$(event) run return 0

$data modify storage macro:engine _event_tmp set from storage macro:engine events.$(event)

$execute as @a[name=$(player),limit=1] run function macro:event/internal/fire_next
data remove storage macro:engine _event_tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"event/fire_to_player ","color":"aqua"},{"text":"$(event) → $(player)","color":"aqua"}]}
