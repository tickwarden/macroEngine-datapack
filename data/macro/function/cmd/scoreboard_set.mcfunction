$execute as @a[name=$(player),limit=1] at @s run scoreboard players set @s $(objective) $(value)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/scoreboard_set ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(value)","color":"aqua"}]
