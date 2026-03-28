# macro:lib/fiber/internal/yield_exec [MACRO]
# INPUT: $(id), $(resume), $(delay)

# Do not continue if fiber is dead
$execute unless data storage macro:engine fibers.$(id){alive:1b} run return 0

# Write resume point to fiber record (readable by is_alive/resume)
$data modify storage macro:engine fibers.$(id).resume set value "$(resume)"

# Add this fiber's resume request to the _pending queue.
# resume_dispatch consumes _pending[0] each call → yield/dispatch match 1:1.
$data modify storage macro:engine fibers._pending append value {id:"$(id)", func:"$(resume)"}

# Add dispatch entry to process_queue — runs after delay ticks
$data modify storage macro:engine queue append value {func:"macro:lib/fiber/internal/resume_dispatch", delay:$(delay)}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/fiber/yield ","color":"aqua"},{"text":"$(id)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(resume)","color":"aqua"},{"text":" in $(delay)t","color":"#555555"}]
