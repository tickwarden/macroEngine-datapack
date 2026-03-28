$execute as @a[name=$(player),limit=1] at @s unless items entity @s *.* *[minecraft:custom_data=$(customData)] run $(invoke)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/player_unless_item ","color":"aqua"},{"text":"$(player)","color":"white"}]
