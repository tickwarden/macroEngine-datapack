$scoreboard players set $lc_a macro.tmp $(a)
$scoreboard players set $lc_b macro.tmp $(b)
$scoreboard players set $lc_t macro.tmp $(t)

execute if score $lc_t macro.tmp matches ..-1 run scoreboard players set $lc_t macro.tmp 0
scoreboard players set $lc_100 macro.tmp 100
execute if score $lc_t macro.tmp > $lc_100 macro.tmp run scoreboard players operation $lc_t macro.tmp = $lc_100 macro.tmp

scoreboard players operation $lc_r macro.tmp = $lc_b macro.tmp
scoreboard players operation $lc_r macro.tmp -= $lc_a macro.tmp

scoreboard players operation $lc_r macro.tmp *= $lc_t macro.tmp
scoreboard players operation $lc_r macro.tmp /= $lc_100 macro.tmp
scoreboard players operation $lc_r macro.tmp += $lc_a macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $lc_r macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/lerp_clamped ","color":"aqua"},{"text":"a=","color":"#555555"},{"text":"$(a)","color":"white"},{"text":" b=","color":"#555555"},{"text":"$(b)","color":"white"},{"text":" t=","color":"#555555"},{"text":"$(t)","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
