$scoreboard players set $mmx_a macro.tmp $(a)
$scoreboard players set $mmx_b macro.tmp $(b)

scoreboard players operation $mmx_lo macro.tmp = $mmx_a macro.tmp
execute if score $mmx_b macro.tmp < $mmx_a macro.tmp run scoreboard players operation $mmx_lo macro.tmp = $mmx_b macro.tmp

scoreboard players operation $mmx_hi macro.tmp = $mmx_a macro.tmp
execute if score $mmx_b macro.tmp > $mmx_a macro.tmp run scoreboard players operation $mmx_hi macro.tmp = $mmx_b macro.tmp

execute store result storage macro:output min int 1 run scoreboard players get $mmx_lo macro.tmp
execute store result storage macro:output max int 1 run scoreboard players get $mmx_hi macro.tmp

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/minmax ","color":"aqua"},{"text":"($(a),$(b))","color":"gray"},{"text":" → ","color":"#555555"},{"text":"min=","color":"gray"},{"storage":"macro:output","nbt":"min","color":"green"},{"text":" max=","color":"gray"},{"storage":"macro:output","nbt":"max","color":"green"}]}
