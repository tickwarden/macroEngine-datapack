function macro:cmd/other/multi_cmd/internal/step_func
data remove storage macro:engine _mcmd_list
data remove storage macro:engine _mcmd_entry
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run_func ","color":"aqua"},{"text":"✔ func batch done","color":"green"}]
