$scoreboard players set $ttt_t macro.tmp $(ticks)

execute if score $ttt_t macro.tmp matches ..-1 run scoreboard players set $ttt_t macro.tmp 0

scoreboard players operation $ttt_r macro.tmp = $ttt_t macro.tmp
scoreboard players set $ttt_20 macro.tmp 20
scoreboard players operation $ttt_r macro.tmp %= $ttt_20 macro.tmp
execute store result storage macro:output ticks int 1 run scoreboard players get $ttt_r macro.tmp

scoreboard players operation $ttt_t macro.tmp /= $ttt_20 macro.tmp

scoreboard players operation $ttt_r macro.tmp = $ttt_t macro.tmp
scoreboard players set $ttt_60 macro.tmp 60
scoreboard players operation $ttt_r macro.tmp %= $ttt_60 macro.tmp
execute store result storage macro:output seconds int 1 run scoreboard players get $ttt_r macro.tmp

scoreboard players operation $ttt_t macro.tmp /= $ttt_60 macro.tmp

scoreboard players operation $ttt_r macro.tmp = $ttt_t macro.tmp
scoreboard players operation $ttt_r macro.tmp %= $ttt_60 macro.tmp
execute store result storage macro:output minutes int 1 run scoreboard players get $ttt_r macro.tmp

scoreboard players operation $ttt_t macro.tmp /= $ttt_60 macro.tmp
execute store result storage macro:output hours int 1 run scoreboard players get $ttt_t macro.tmp

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/ticks_to_time ","color":"aqua"},{"text":"($(ticks)t)","color":"gray"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"hours","color":"green"},{"text":"h ","color":"gray"},{"storage":"macro:output","nbt":"minutes","color":"green"},{"text":"m ","color":"gray"},{"storage":"macro:output","nbt":"seconds","color":"green"},{"text":"s ","color":"gray"},{"storage":"macro:output","nbt":"ticks","color":"green"},{"text":"t","color":"gray"}]}
