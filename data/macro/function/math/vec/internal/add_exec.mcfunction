# macro:math/vec/internal/add_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

$scoreboard players set $vx macro.tmp $(ax)
$scoreboard players set $vy macro.tmp $(ay)
$scoreboard players set $vz macro.tmp $(az)
$scoreboard players add $vx macro.tmp $(bx)
$scoreboard players add $vy macro.tmp $(by)
$scoreboard players add $vz macro.tmp $(bz)

execute store result storage macro:output x int 1 run scoreboard players get $vx macro.tmp
execute store result storage macro:output y int 1 run scoreboard players get $vy macro.tmp
execute store result storage macro:output z int 1 run scoreboard players get $vz macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/vec/add ","color":"aqua"},{"text":"($(ax),$(ay),$(az))+($(bx),$(by),$(bz)) → ","color":"gray"},{"storage":"macro:output","nbt":"x","color":"yellow"},{"text":",","color":"gray"},{"storage":"macro:output","nbt":"y","color":"yellow"},{"text":",","color":"gray"},{"storage":"macro:output","nbt":"z","color":"yellow"}]
