# macro:math/vec/internal/dot_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)

$scoreboard players set $vdax macro.tmp $(ax)
$scoreboard players set $vdbx macro.tmp $(bx)
scoreboard players operation $vdax macro.tmp *= $vdbx macro.tmp

$scoreboard players set $vday macro.tmp $(ay)
$scoreboard players set $vdby macro.tmp $(by)
scoreboard players operation $vday macro.tmp *= $vdby macro.tmp

$scoreboard players set $vdaz macro.tmp $(az)
$scoreboard players set $vdbz macro.tmp $(bz)
scoreboard players operation $vdaz macro.tmp *= $vdbz macro.tmp

scoreboard players operation $vdax macro.tmp += $vday macro.tmp
scoreboard players operation $vdax macro.tmp += $vdaz macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $vdax macro.tmp

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/vec/dot ","color":"aqua"},{"text":"($(ax),$(ay),$(az))·($(bx),$(by),$(bz)) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"yellow"}]}
