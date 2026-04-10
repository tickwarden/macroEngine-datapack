# macro:queue/push
# Appends a function call to the rate-limited work queue.
# The engine will execute it at up to work_queue_rate calls/tick.
#
# DIFFERENT from lib/queue_add:
#   lib/queue_add  → delay-based scheduler (run after N ticks)
#   queue/push     → throughput limiter   (process heavy lists without lag spikes)
#
# Input  (macro:input queue):
#   fn — fully-qualified function path  e.g. "mypack:do_thing"
#
# Usage:
#   data modify storage macro:input queue.fn set value "mypack:do_thing"
#   function macro:queue/push with storage macro:input queue

$data modify storage macro:engine work_queue append value {fn:"$(fn)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"queue/push ","color":"aqua"},{"text":"→ ","color":"#555555"},{"text":"$(fn)","color":"white"}]
