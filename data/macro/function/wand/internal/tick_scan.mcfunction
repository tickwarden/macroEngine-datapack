# macro:wand/internal/tick_scan
# Her tick: macro.rightClick skoru 1+ olan oyuncuları tespit et,
# ellerindeki itemi kontrol et, eşleşen bind'ı çalıştır.

execute unless data storage macro:engine wand_binds[0] run return 0

execute as @a[scores={macro.rightClick=1..}] at @s run function macro:wand/internal/dispatch
scoreboard players set @a[scores={macro.rightClick=1..}] macro.rightClick 0
