$execute as @a[name=$(player),limit=1] run stopsound @s $(category) $(sound)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/stopsound ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(sound)","color":"aqua"}]
