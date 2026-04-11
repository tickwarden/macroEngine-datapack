# [MACRO] INPUT: $(name), $(has)
$execute if data storage macro:engine _mcmd_cond_tmp{has:1b} unless entity @s[tag=$(name)] run scoreboard players set $mcmd_cond_result macro.tmp 0
$execute if data storage macro:engine _mcmd_cond_tmp{has:0b} if entity @s[tag=$(name)] run scoreboard players set $mcmd_cond_result macro.tmp 0
