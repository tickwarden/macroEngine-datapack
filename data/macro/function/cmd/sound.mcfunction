$execute as @a[name=$(player),limit=1] at @s run playsound $(sound) master @s ~ ~ ~ $(volume) $(pitch)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/sound ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(sound)","color":"aqua"}]
