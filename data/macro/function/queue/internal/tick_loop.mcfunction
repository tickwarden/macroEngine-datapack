# macro:queue/internal/tick_loop
# Recursive loop: processes one item then calls itself until
# #wq_rate reaches 0 or the queue is empty.
# Max recursion depth = work_queue_rate (keep ≤ 64 for safety).

execute unless data storage macro:engine work_queue[0] run return 0
execute if score #wq_rate macro.tmp matches ..0 run return 0

scoreboard players remove #wq_rate macro.tmp 1
function macro:queue/internal/exec_next

function macro:queue/internal/tick_loop
