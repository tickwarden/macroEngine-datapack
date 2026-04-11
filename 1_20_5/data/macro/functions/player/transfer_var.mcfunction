$execute store result score $tr_f macro.tmp run data get storage macro:engine players.$(from).$(key)
$scoreboard players set $tr_a macro.tmp $(amount)
scoreboard players operation $tr_f macro.tmp -= $tr_a macro.tmp
$execute store result storage macro:engine players.$(from).$(key) int 1 run scoreboard players get $tr_f macro.tmp

$execute store result score $tr_t macro.tmp run data get storage macro:engine players.$(to).$(key)
scoreboard players operation $tr_t macro.tmp += $tr_a macro.tmp
$execute store result storage macro:engine players.$(to).$(key) int 1 run scoreboard players get $tr_t macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $tr_t macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/transfer_var ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
