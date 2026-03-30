scoreboard players set $inv_cnt macro.tmp 0
$execute as @a[name=$(player),limit=1] run execute store result score $inv_cnt macro.tmp run clear @s minecraft:carrot_on_a_stick{wand:"$(customData)"} 0
execute store result storage macro:output count int 1 run scoreboard players get $inv_cnt macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/count_item ","color":"aqua"},{"text":"$(player)","color":"white"}]}
