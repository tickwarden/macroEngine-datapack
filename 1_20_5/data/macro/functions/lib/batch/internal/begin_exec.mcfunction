# macro:lib/batch/internal/begin_exec [MACRO]
# INPUT: $(id), $(spread_over)

$data modify storage macro:engine batches.$(id) set value {items:[],spread_over:$(spread_over),flushed:0b}

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/batch/begin ","color":"aqua"},{"text":"$(id)","color":"white"},{"text":" spread_over=$(spread_over)t","color":"#555555"}]}
