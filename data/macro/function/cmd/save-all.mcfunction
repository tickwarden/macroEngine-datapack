# macro:cmd/save-all
# Server-only. Wrapped to avoid parse error in singleplayer
# executed via storage macro.
execute unless function macro:tools/utils/check_all run return 0

data modify storage macro:input cmd set value "save-all"
function macro:cmd/other/run_self with storage macro:input {}
data remove storage macro:input cmd

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/save-all","color":"aqua"}]
