data modify storage macro:output result set value 0b

$scoreboard players set $rgn_x macro.tmp $(x)
$scoreboard players set $rgn_y macro.tmp $(y)
$scoreboard players set $rgn_z macro.tmp $(z)
$scoreboard players set $rgn_x1 macro.tmp $(x1)
$scoreboard players set $rgn_y1 macro.tmp $(y1)
$scoreboard players set $rgn_z1 macro.tmp $(z1)
$scoreboard players set $rgn_x2 macro.tmp $(x2)
$scoreboard players set $rgn_y2 macro.tmp $(y2)
$scoreboard players set $rgn_z2 macro.tmp $(z2)

# min/max normalization
execute if score $rgn_x1 macro.tmp > $rgn_x2 macro.tmp run scoreboard players operation $rgn_t macro.tmp = $rgn_x1 macro.tmp
execute if score $rgn_x1 macro.tmp > $rgn_x2 macro.tmp run scoreboard players operation $rgn_x1 macro.tmp = $rgn_x2 macro.tmp
execute if score $rgn_t macro.tmp > $rgn_x2 macro.tmp run scoreboard players operation $rgn_x2 macro.tmp = $rgn_t macro.tmp

execute if score $rgn_y1 macro.tmp > $rgn_y2 macro.tmp run scoreboard players operation $rgn_t macro.tmp = $rgn_y1 macro.tmp
execute if score $rgn_y1 macro.tmp > $rgn_y2 macro.tmp run scoreboard players operation $rgn_y1 macro.tmp = $rgn_y2 macro.tmp
execute if score $rgn_t macro.tmp > $rgn_y2 macro.tmp run scoreboard players operation $rgn_y2 macro.tmp = $rgn_t macro.tmp

execute if score $rgn_z1 macro.tmp > $rgn_z2 macro.tmp run scoreboard players operation $rgn_t macro.tmp = $rgn_z1 macro.tmp
execute if score $rgn_z1 macro.tmp > $rgn_z2 macro.tmp run scoreboard players operation $rgn_z1 macro.tmp = $rgn_z2 macro.tmp
execute if score $rgn_t macro.tmp > $rgn_z2 macro.tmp run scoreboard players operation $rgn_z2 macro.tmp = $rgn_t macro.tmp

execute if score $rgn_x macro.tmp < $rgn_x1 macro.tmp run return 0
execute if score $rgn_x macro.tmp > $rgn_x2 macro.tmp run return 0
execute if score $rgn_y macro.tmp < $rgn_y1 macro.tmp run return 0
execute if score $rgn_y macro.tmp > $rgn_y2 macro.tmp run return 0
execute if score $rgn_z macro.tmp < $rgn_z1 macro.tmp run return 0
execute if score $rgn_z macro.tmp > $rgn_z2 macro.tmp run return 0

data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/in_region ","color":"aqua"},{"text":"($(x),$(y),$(z)) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
