# macro:queue/size
# Writes the current work_queue item count to macro:output queue.size.
# No macro input required.
#
# Output (macro:output queue):
#   size — int  number of pending items
#
# Usage:
#   function macro:queue/size
#   data get storage macro:output queue.size

execute store result storage macro:output queue.size int 1 run data get storage macro:engine work_queue
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"queue/size ","color":"aqua"},{"text":"→ ","color":"#555555"},{"storage":"macro:output","nbt":"queue.size","color":"yellow"}]
