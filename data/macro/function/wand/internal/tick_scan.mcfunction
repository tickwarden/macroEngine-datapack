# macro:wand/internal/tick_scan
# Every tick: detect players with macro.rightClick score 1+,
# check their held item, run the matching bind.

execute unless data storage macro:engine wand_binds[0] run return 0

execute as @a[scores={macro.rightClick=1..}] at @s run function macro:wand/internal/dispatch
scoreboard players set @a[scores={macro.rightClick=1..}] macro.rightClick 0
