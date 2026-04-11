execute store result storage macro:engine global.tick int 1 run scoreboard players get $tick macro.tmp
execute store result storage macro:engine global.epoch int 1 run scoreboard players get $epoch macro.time
scoreboard players set $tick macro.tmp 0
