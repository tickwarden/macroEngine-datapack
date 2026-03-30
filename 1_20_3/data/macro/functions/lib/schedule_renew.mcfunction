$execute unless data storage macro:engine schedules.$(key) run return 0
$data modify storage macro:engine _sched_tmp set from storage macro:engine schedules.$(key)
execute if data storage macro:engine _sched_tmp.func run function macro:lib/internal/schedule_requeue with storage macro:engine _sched_tmp
execute if data storage macro:engine _sched_tmp.cmd run function macro:lib/internal/schedule_requeue_cmd with storage macro:engine _sched_tmp
data remove storage macro:engine _sched_tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/schedule_renew ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]}
