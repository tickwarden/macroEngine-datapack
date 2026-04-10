# macro:queue/internal/tick
# Rate-limited work queue dispatcher — called every tick by tick.mcfunction.
# Reads work_queue_rate and processes up to that many items.
# Early-exit if queue is empty (zero overhead when idle).

execute unless data storage macro:engine work_queue[0] run return 0

execute store result score #wq_rate macro.tmp run data get storage macro:engine work_queue_rate
execute if score #wq_rate macro.tmp matches ..0 run return 0

function macro:queue/internal/tick_loop
