execute if data storage macro:engine pb_obj run scoreboard players operation $pb_mod macro.tmp = $epoch macro.time
execute if data storage macro:engine pb_obj run scoreboard players operation $pb_mod macro.tmp %= $pb_four macro.tmp
execute if data storage macro:engine pb_obj run execute if score $pb_mod macro.tmp matches 0 run execute as @a run function macro:string/progress_bar_self with storage macro:engine {}
