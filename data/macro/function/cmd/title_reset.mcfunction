$execute as @a[name=$(player),limit=1] at @s run title @s reset
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/title_reset ","color":"aqua"},{"text":"$(player)","color":"white"}]
