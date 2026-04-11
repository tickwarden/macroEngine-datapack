# [MACRO] INPUT: $(objective), $(min), $(max)
$execute store result score $mcmd_cond_score macro.tmp run scoreboard players get @s $(objective)
$execute if score $mcmd_cond_score macro.tmp matches $(min)..$(max) run return 0
scoreboard players set $mcmd_cond_result macro.tmp 0
