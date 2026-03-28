# macro:lib/batch/internal/cancel_exec [MACRO]
# INPUT: $(id)

$execute unless data storage macro:engine batches.$(id) run return 0
$data remove storage macro:engine batches.$(id)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/batch/cancel ","color":"aqua"},{"text":"$(id)","color":"white"},{"text":" — cancelled","color":"#FF5555"}]
