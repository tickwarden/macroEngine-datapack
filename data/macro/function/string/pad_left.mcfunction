$scoreboard players set $pl_v macro.tmp $(value)
$scoreboard players set $pl_w macro.tmp $(width)

scoreboard players set $pl_neg macro.tmp -1
execute if score $pl_v macro.tmp matches ..-1 run scoreboard players operation $pl_v macro.tmp *= $pl_neg macro.tmp

scoreboard players set $pl_digits macro.tmp 1
execute if score $pl_v macro.tmp matches 10.. run scoreboard players set $pl_digits macro.tmp 2
execute if score $pl_v macro.tmp matches 100.. run scoreboard players set $pl_digits macro.tmp 3
execute if score $pl_v macro.tmp matches 1000.. run scoreboard players set $pl_digits macro.tmp 4
execute if score $pl_v macro.tmp matches 10000.. run scoreboard players set $pl_digits macro.tmp 5
execute if score $pl_v macro.tmp matches 100000.. run scoreboard players set $pl_digits macro.tmp 6
execute if score $pl_v macro.tmp matches 1000000.. run scoreboard players set $pl_digits macro.tmp 7
execute if score $pl_v macro.tmp matches 10000000.. run scoreboard players set $pl_digits macro.tmp 8

scoreboard players operation $pl_pad macro.tmp = $pl_w macro.tmp
scoreboard players operation $pl_pad macro.tmp -= $pl_digits macro.tmp

data modify storage macro:output result set value ""

execute if score $pl_pad macro.tmp matches 1.. run data modify storage macro:output result set value "0"
execute if score $pl_pad macro.tmp matches 2.. run data modify storage macro:output result set value "00"
execute if score $pl_pad macro.tmp matches 3.. run data modify storage macro:output result set value "000"
execute if score $pl_pad macro.tmp matches 4.. run data modify storage macro:output result set value "0000"
execute if score $pl_pad macro.tmp matches 5.. run data modify storage macro:output result set value "00000"
execute if score $pl_pad macro.tmp matches 6.. run data modify storage macro:output result set value "000000"
execute if score $pl_pad macro.tmp matches 7.. run data modify storage macro:output result set value "0000000"

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/pad_left ","color":"aqua"},{"text":"$(value) w=$(width) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"},{"text":"[NUM]","color":"#555555"}]
