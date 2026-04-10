# macro:queue/internal/flush_loop
# Drains the entire work_queue in one call stack (used by queue/flush).
# Recursion depth = queue size — do NOT call on large queues.

execute unless data storage macro:engine work_queue[0] run return 0
function macro:queue/internal/exec_next
function macro:queue/internal/flush_loop
