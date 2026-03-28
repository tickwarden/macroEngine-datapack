# macro:math/vec/internal/cross_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

# cx = ay*bz - az*by
$scoreboard players set $vcay macro.tmp $(ay)
$scoreboard players set $vcbz macro.tmp $(bz)
scoreboard players operation $vcay macro.tmp *= $vcbz macro.tmp

$scoreboard players set $vcaz macro.tmp $(az)
$scoreboard players set $vcby macro.tmp $(by)
scoreboard players operation $vcaz macro.tmp *= $vcby macro.tmp

scoreboard players operation $vcay macro.tmp -= $vcaz macro.tmp
execute store result storage macro:output x int 1 run scoreboard players get $vcay macro.tmp

# cy = az*bx - ax*bz
$scoreboard players set $vcaz2 macro.tmp $(az)
$scoreboard players set $vcbx macro.tmp $(bx)
scoreboard players operation $vcaz2 macro.tmp *= $vcbx macro.tmp

$scoreboard players set $vcax macro.tmp $(ax)
$scoreboard players set $vcbz2 macro.tmp $(bz)
scoreboard players operation $vcax macro.tmp *= $vcbz2 macro.tmp

scoreboard players operation $vcaz2 macro.tmp -= $vcax macro.tmp
execute store result storage macro:output y int 1 run scoreboard players get $vcaz2 macro.tmp

# cz = ax*by - ay*bx
$scoreboard players set $vcax2 macro.tmp $(ax)
$scoreboard players set $vcby2 macro.tmp $(by)
scoreboard players operation $vcax2 macro.tmp *= $vcby2 macro.tmp

$scoreboard players set $vcay2 macro.tmp $(ay)
$scoreboard players set $vcbx2 macro.tmp $(bx)
scoreboard players operation $vcay2 macro.tmp *= $vcbx2 macro.tmp

scoreboard players operation $vcax2 macro.tmp -= $vcay2 macro.tmp
execute store result storage macro:output z int 1 run scoreboard players get $vcax2 macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/vec/cross ","color":"aqua"},{"text":"($(ax),$(ay),$(az))×($(bx),$(by),$(bz)) → ","color":"gray"},{"storage":"macro:output","nbt":"x","color":"yellow"},{"text":",","color":"gray"},{"storage":"macro:output","nbt":"y","color":"yellow"},{"text":",","color":"gray"},{"storage":"macro:output","nbt":"z","color":"yellow"}]
