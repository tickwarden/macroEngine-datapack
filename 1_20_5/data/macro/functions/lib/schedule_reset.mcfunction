$execute unless data storage macro:engine schedules.$(key) run return 0

$data modify storage macro:engine _sreset set from storage macro:engine schedules.$(key)
$data modify storage macro:engine _sreset.key set value "$(key)"

$data remove storage macro:engine schedules.$(key)

execute if data storage macro:engine _sreset.func if data storage macro:engine _sreset.player run function macro:lib/internal/schedule_reset_do_as with storage macro:engine _sreset
execute if data storage macro:engine _sreset.func unless data storage macro:engine _sreset.player run function macro:lib/internal/schedule_reset_do with storage macro:engine _sreset
execute if data storage macro:engine _sreset.cmd if data storage macro:engine _sreset.player run function macro:lib/internal/schedule_reset_do_cmd_as with storage macro:engine _sreset
execute if data storage macro:engine _sreset.cmd unless data storage macro:engine _sreset.player run function macro:lib/internal/schedule_reset_do_cmd with storage macro:engine _sreset
data remove storage macro:engine _sreset
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/schedule_reset ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
