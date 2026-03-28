$scoreboard players set $rnd_min macro.tmp $(min)
$scoreboard players set $rnd_max macro.tmp $(max)

scoreboard players operation $rnd_max macro.tmp -= $rnd_min macro.tmp
scoreboard players add $rnd_max macro.tmp 1

execute if data storage macro:engine _rng_state run execute store result score $rnd macro.tmp run data get storage macro:engine _rng_state
execute unless data storage macro:engine _rng_state run execute store result score $rnd macro.tmp run scoreboard players get $epoch macro.time
execute unless data storage macro:engine _rng_state run scoreboard players add $rnd macro.tmp 57005

scoreboard players set $rnd_tick macro.tmp 31
execute store result score $rnd_t macro.tmp run scoreboard players get $tick macro.tmp
scoreboard players operation $rnd_t macro.tmp *= $rnd_tick macro.tmp
scoreboard players operation $rnd macro.tmp += $rnd_t macro.tmp

scoreboard players set $rnd_a macro.tmp 1664525
scoreboard players operation $rnd macro.tmp *= $rnd_a macro.tmp
scoreboard players add $rnd macro.tmp 1013904223

execute store result storage macro:engine _rng_state int 1 run scoreboard players get $rnd macro.tmp

execute if score $rnd macro.tmp matches -2147483648 run scoreboard players set $rnd macro.tmp 2147483647
execute if score $rnd macro.tmp matches ..-1 run scoreboard players set $rnd_neg macro.tmp -1
execute if score $rnd macro.tmp matches ..-1 run scoreboard players operation $rnd macro.tmp *= $rnd_neg macro.tmp

scoreboard players operation $rnd macro.tmp %= $rnd_max macro.tmp
execute if score $rnd macro.tmp matches ..-1 run scoreboard players operation $rnd macro.tmp += $rnd_max macro.tmp
scoreboard players operation $rnd macro.tmp += $rnd_min macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $rnd macro.tmp
