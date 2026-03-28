# macro:math/vec/internal/angle_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)
# RULE: Lines without $(var) must NOT have a $ prefix.

function macro:lib/input_push

$data modify storage macro:input ax set value $(ax)
$data modify storage macro:input ay set value $(ay)
$data modify storage macro:input az set value $(az)
$data modify storage macro:input bx set value $(bx)
$data modify storage macro:input by set value $(by)
$data modify storage macro:input bz set value $(bz)
function macro:math/vec/dot with storage macro:input {}
execute store result score $vang_dot macro.tmp run data get storage macro:output result

data modify storage macro:input x1 set value 0
data modify storage macro:input y1 set value 0
data modify storage macro:input z1 set value 0
$data modify storage macro:input x2 set value $(ax)
$data modify storage macro:input y2 set value $(ay)
$data modify storage macro:input z2 set value $(az)
function macro:math/distance3d with storage macro:input {}
execute store result score $vang_la macro.tmp run data get storage macro:output result

$data modify storage macro:input x2 set value $(bx)
$data modify storage macro:input y2 set value $(by)
$data modify storage macro:input z2 set value $(bz)
function macro:math/distance3d with storage macro:input {}
execute store result score $vang_lb macro.tmp run data get storage macro:output result

function macro:lib/input_pop

data modify storage macro:output result set value 0

execute if score $vang_la macro.tmp matches 0 run return 0
execute if score $vang_lb macro.tmp matches 0 run return 0

scoreboard players set $vang_1000 macro.tmp 1000
scoreboard players operation $vang_dot macro.tmp *= $vang_1000 macro.tmp
scoreboard players operation $vang_la macro.tmp *= $vang_lb macro.tmp
scoreboard players operation $vang_dot macro.tmp /= $vang_la macro.tmp

execute if score $vang_dot macro.tmp matches 1001.. run scoreboard players set $vang_dot macro.tmp 1000
execute if score $vang_dot macro.tmp matches ..-1001 run scoreboard players set $vang_dot macro.tmp -1000

execute store result storage macro:engine _vang_cos int 1 run scoreboard players get $vang_dot macro.tmp
function macro:math/vec/internal/arccos_lookup
