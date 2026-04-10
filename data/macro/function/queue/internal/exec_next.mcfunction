# macro:queue/internal/exec_next
# Pops work_queue[0] into _wq_job, removes it from the list,
# then dispatches to the appropriate runner.
# player field present → execute as that player (skipped if offline).
# player field absent  → run in server context.

data modify storage macro:engine _wq_job set from storage macro:engine work_queue[0]
data remove storage macro:engine work_queue[0]

execute if data storage macro:engine _wq_job.player run function macro:queue/internal/exec_as with storage macro:engine _wq_job
execute unless data storage macro:engine _wq_job.player run function macro:queue/internal/exec_fn with storage macro:engine _wq_job

data remove storage macro:engine _wq_job
