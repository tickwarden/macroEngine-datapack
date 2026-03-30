$execute store result score $cv macro.tmp run data get storage macro:engine players.$(player).$(key)
$scoreboard players set $cv_mn macro.tmp $(min)
$scoreboard players set $cv_mx macro.tmp $(max)
execute if score $cv macro.tmp < $cv_mn macro.tmp run scoreboard players operation $cv macro.tmp = $cv_mn macro.tmp
execute if score $cv macro.tmp > $cv_mx macro.tmp run scoreboard players operation $cv macro.tmp = $cv_mx macro.tmp
$execute store result storage macro:engine players.$(player).$(key) int 1 run scoreboard players get $cv macro.tmp
execute store result storage macro:output result int 1 run scoreboard players get $cv macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/clamp_var ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
