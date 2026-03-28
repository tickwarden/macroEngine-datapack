data modify storage macro:output result set value 0b

$scoreboard players set $sph_dx macro.tmp $(x)
$scoreboard players set $sph_cx macro.tmp $(cx)
scoreboard players operation $sph_dx macro.tmp -= $sph_cx macro.tmp

$scoreboard players set $sph_dy macro.tmp $(y)
$scoreboard players set $sph_cy macro.tmp $(cy)
scoreboard players operation $sph_dy macro.tmp -= $sph_cy macro.tmp

$scoreboard players set $sph_dz macro.tmp $(z)
$scoreboard players set $sph_cz macro.tmp $(cz)
scoreboard players operation $sph_dz macro.tmp -= $sph_cz macro.tmp

# Overflow prevention (max 26754 per axis)
execute if score $sph_dx macro.tmp matches 26755.. run scoreboard players set $sph_dx macro.tmp 26754
execute if score $sph_dx macro.tmp matches ..-26755 run scoreboard players set $sph_dx macro.tmp -26754
execute if score $sph_dy macro.tmp matches 26755.. run scoreboard players set $sph_dy macro.tmp 26754
execute if score $sph_dy macro.tmp matches ..-26755 run scoreboard players set $sph_dy macro.tmp -26754
execute if score $sph_dz macro.tmp matches 26755.. run scoreboard players set $sph_dz macro.tmp 26754
execute if score $sph_dz macro.tmp matches ..-26755 run scoreboard players set $sph_dz macro.tmp -26754

scoreboard players operation $sph_dx macro.tmp *= $sph_dx macro.tmp
scoreboard players operation $sph_dy macro.tmp *= $sph_dy macro.tmp
scoreboard players operation $sph_dz macro.tmp *= $sph_dz macro.tmp

scoreboard players operation $sph_dsq macro.tmp = $sph_dx macro.tmp
scoreboard players operation $sph_dsq macro.tmp += $sph_dy macro.tmp
scoreboard players operation $sph_dsq macro.tmp += $sph_dz macro.tmp
execute store result storage macro:output dist_sq int 1 run scoreboard players get $sph_dsq macro.tmp

$scoreboard players set $sph_r macro.tmp $(r)
scoreboard players operation $sph_r macro.tmp *= $sph_r macro.tmp

execute if score $sph_dsq macro.tmp <= $sph_r macro.tmp run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/in_sphere ","color":"aqua"},{"text":"r=$(r) dsq=","color":"gray"},{"score":{"name":"$sph_dsq","objective":"macro.tmp"},"color":"yellow"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
