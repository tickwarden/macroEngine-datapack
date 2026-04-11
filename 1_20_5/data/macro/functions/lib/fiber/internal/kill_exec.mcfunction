# macro:lib/fiber/internal/kill_exec [MACRO]
# INPUT: $(id)

$execute unless data storage macro:engine fibers.$(id) run return 0

$data remove storage macro:engine fibers.$(id).alive
$data remove storage macro:engine fibers.$(id).resume

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/fiber/kill ","color":"aqua"},{"text":"[killed] ","color":"#FF5555"},{"text":"$(id)","color":"white"}]}
