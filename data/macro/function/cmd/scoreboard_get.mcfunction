$execute store result storage macro:output result int 1 run scoreboard players get @a[name=$(player),limit=1] $(objective)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/scoreboard_get ","color":"aqua"},{"text":"$(player)","color":"white"}]
