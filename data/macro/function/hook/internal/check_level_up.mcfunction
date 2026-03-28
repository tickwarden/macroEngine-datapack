execute store result score $hlvl_cur macro.tmp run data get entity @s XpLevel
execute if score @s macro.hook_lvl < $hlvl_cur macro.tmp run scoreboard players operation @s macro.hook_lvl_new = $hlvl_cur macro.tmp
execute if score @s macro.hook_lvl < $hlvl_cur macro.tmp run function macro:hook/internal/on_level_up
execute store result score @s macro.hook_lvl run scoreboard players get $hlvl_cur macro.tmp
