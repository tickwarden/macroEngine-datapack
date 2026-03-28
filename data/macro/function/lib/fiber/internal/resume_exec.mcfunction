# macro:lib/fiber/internal/resume_exec [MACRO]
# INPUT: $(id), $(func)
# _fib_cur'dan beslenir.

# Is the fiber still alive?
$execute unless data storage macro:engine fibers.$(id){alive:1b} run return 0

# Run
$function $(func)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/fiber/resume ","color":"aqua"},{"text":"[run] ","color":"green"},{"text":"$(id)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
