# macro:queue/clear
# Discards all pending work_queue items immediately.
# No macro input required.
#
# Usage:
#   function macro:queue/clear

data modify storage macro:engine work_queue set value []
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"queue/clear ","color":"aqua"},{"text":"→ work_queue emptied","color":"#555555"}]
