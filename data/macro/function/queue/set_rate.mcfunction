# macro:queue/set_rate
# Sets how many work_queue items are processed per tick.
# Default: 1. Raise for faster throughput; lower to reduce tick cost.
# A value of 0 pauses processing.
#
# Input  (macro:input queue):
#   rate — integer ≥ 0
#
# Usage:
#   data modify storage macro:input queue.rate set value 4
#   function macro:queue/set_rate with storage macro:input queue

$data modify storage macro:engine work_queue_rate set value $(rate)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"queue/set_rate ","color":"aqua"},{"text":"→ ","color":"#555555"},{"text":"$(rate)","color":"yellow"},{"text":" items/tick","color":"#555555"}]
