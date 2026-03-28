# macro:lib/fiber/internal/resume_dispatch
# Called by process_queue.
# Pops _pending[0], checks fiber alive status, runs the function.

execute unless data storage macro:engine fibers._pending[0] run return 0

data modify storage macro:engine _fib_cur set from storage macro:engine fibers._pending[0]
data remove storage macro:engine fibers._pending[0]

function macro:lib/fiber/internal/resume_exec with storage macro:engine _fib_cur
data remove storage macro:engine _fib_cur