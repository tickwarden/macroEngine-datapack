function macro:cmd/other/multi_cmd/internal/step
data remove storage macro:engine _mcmd_list
data remove storage macro:engine _mcmd_entry
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run ","color":"aqua"},{"text":"✔ batch done","color":"green"}]}
