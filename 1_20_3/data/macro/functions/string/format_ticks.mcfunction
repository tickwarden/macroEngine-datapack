$scoreboard players set $ft_t macro.tmp $(ticks)

scoreboard players set $ft_20 macro.tmp 20
scoreboard players operation $ft_s macro.tmp = $ft_t macro.tmp
scoreboard players operation $ft_s macro.tmp /= $ft_20 macro.tmp

execute store result storage macro:output total_seconds int 1 run scoreboard players get $ft_s macro.tmp

scoreboard players set $ft_60 macro.tmp 60
scoreboard players operation $ft_m macro.tmp = $ft_s macro.tmp
scoreboard players operation $ft_m macro.tmp /= $ft_60 macro.tmp

scoreboard players operation $ft_s macro.tmp %= $ft_60 macro.tmp

execute store result storage macro:output minutes int 1 run scoreboard players get $ft_m macro.tmp
execute store result storage macro:output seconds int 1 run scoreboard players get $ft_s macro.tmp

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/format_ticks ","color":"aqua"},{"text":"$(ticks)t","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"minutes","color":"green"},{"text":"m ","color":"#555555"},{"storage":"macro:output","nbt":"seconds","color":"green"},{"text":"s","color":"#555555"}]}
