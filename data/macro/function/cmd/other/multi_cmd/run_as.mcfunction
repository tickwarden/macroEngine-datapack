$execute as @a[name=$(player),limit=1] at @s run function macro:cmd/other/multi_cmd/run
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run_as ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" ▶ done","color":"green"}]
