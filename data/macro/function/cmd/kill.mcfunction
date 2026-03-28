$execute as @a[name=$(player),limit=1] at @s run kill @s
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/kill ","color":"aqua"},{"text":"$(player)","color":"white"}]
