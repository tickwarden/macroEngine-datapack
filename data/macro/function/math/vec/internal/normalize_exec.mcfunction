# macro:math/vec/internal/normalize_exec [MACRO]
# INPUT: $(x), $(y), $(z)
# Compute length via math/distance3d, then ×1000 / length
# RULE: Lines without $(var) must NOT have a $ prefix.

function macro:lib/input_push

data modify storage macro:input x1 set value 0
data modify storage macro:input y1 set value 0
data modify storage macro:input z1 set value 0
$data modify storage macro:input x2 set value $(x)
$data modify storage macro:input y2 set value $(y)
$data modify storage macro:input z2 set value $(z)
function macro:math/distance3d with storage macro:input {}

function macro:lib/input_pop

execute store result score $vnlen macro.tmp run data get storage macro:output result

execute if score $vnlen macro.tmp matches 0 run data modify storage macro:output x set value 0
execute if score $vnlen macro.tmp matches 0 run data modify storage macro:output y set value 0
execute if score $vnlen macro.tmp matches 0 run data modify storage macro:output z set value 0
execute if score $vnlen macro.tmp matches 0 run data modify storage macro:output length set value 0
execute if score $vnlen macro.tmp matches 0 run return 0

execute store result storage macro:output length int 1 run scoreboard players get $vnlen macro.tmp

$scoreboard players set $vnx macro.tmp $(x)
scoreboard players set $vn1000 macro.tmp 1000
scoreboard players operation $vnx macro.tmp *= $vn1000 macro.tmp
scoreboard players operation $vnx macro.tmp /= $vnlen macro.tmp
execute store result storage macro:output x int 1 run scoreboard players get $vnx macro.tmp

$scoreboard players set $vny macro.tmp $(y)
scoreboard players operation $vny macro.tmp *= $vn1000 macro.tmp
scoreboard players operation $vny macro.tmp /= $vnlen macro.tmp
execute store result storage macro:output y int 1 run scoreboard players get $vny macro.tmp

$scoreboard players set $vnz macro.tmp $(z)
scoreboard players operation $vnz macro.tmp *= $vn1000 macro.tmp
scoreboard players operation $vnz macro.tmp /= $vnlen macro.tmp
execute store result storage macro:output z int 1 run scoreboard players get $vnz macro.tmp

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/vec/normalize ","color":"aqua"},{"text":"len=","color":"gray"},{"storage":"macro:output","nbt":"length","color":"yellow"},{"text":" → ","color":"gray"},{"storage":"macro:output","nbt":"x","color":"yellow"},{"text":",","color":"gray"},{"storage":"macro:output","nbt":"y","color":"yellow"},{"text":",","color":"gray"},{"storage":"macro:output","nbt":"z","color":"yellow"}]
