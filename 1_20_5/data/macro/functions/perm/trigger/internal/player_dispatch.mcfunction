$scoreboard players operation $ptd_val macro.tmp = @s $(name)

$scoreboard players set @s $(name) 0
$scoreboard players enable @s $(name)

$execute unless data storage macro:engine perm_triggers.$(name)[0] run return 0

$data modify storage macro:engine _ptd_binds set from storage macro:engine perm_triggers.$(name)

function macro:perm/trigger/internal/check_bind
data remove storage macro:engine _ptd_binds
data remove storage macro:engine _ptd_current
