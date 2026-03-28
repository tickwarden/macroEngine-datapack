$execute as @a[name=$(player),limit=1] at @s run title @s subtitle {"text":"$(text)","color":"$(color)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/subtitle ","color":"aqua"},{"text":"$(player)","color":"white"}]
