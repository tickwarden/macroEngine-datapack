# macro:queue/flush
# Processes ALL remaining work_queue items in a single tick.
# WARNING: large queues will cause a lag spike. Use only when you know
#          the queue is small (< ~50 items) or in a controlled context.
# No macro input required.
#
# Usage:
#   function macro:queue/flush

execute if data storage macro:engine work_queue[0] run function macro:queue/internal/flush_loop
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"queue/flush ","color":"aqua"},{"text":"→ done","color":"green"}]
