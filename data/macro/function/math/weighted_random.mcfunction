$scoreboard players set $wr_total macro.tmp $(total)

execute if score $wr_total macro.tmp matches ..0 run data modify storage macro:output result set value -1
execute if score $wr_total macro.tmp matches ..0 run return 0

# Draw random in range 0..total-1
data modify storage macro:input min set value 0
scoreboard players remove $wr_total macro.tmp 1
execute store result storage macro:input max int 1 run scoreboard players get $wr_total macro.tmp
function macro:math/random with storage macro:input {}

execute store result score $wr_roll macro.tmp run data get storage macro:output result
execute store result storage macro:output roll int 1 run scoreboard players get $wr_roll macro.tmp

data modify storage macro:output result set value -1
scoreboard players set $wr_done macro.tmp 0

# Cumulative threshold check
$scoreboard players set $wr_acc macro.tmp $(w0)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 0
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w1)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 1
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w2)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 2
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w3)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 3
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w4)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 4
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w5)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 5
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w6)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 6
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w7)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 7
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w8)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 8
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$scoreboard players add $wr_acc macro.tmp $(w9)
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run data modify storage macro:output result set value 9
execute if score $wr_done macro.tmp matches 0 run execute if score $wr_roll macro.tmp < $wr_acc macro.tmp run scoreboard players set $wr_done macro.tmp 1

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/weighted_random ","color":"aqua"},{"text":"total=$(total) roll=","color":"gray"},{"score":{"name":"$wr_roll","objective":"macro.tmp"},"color":"yellow"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
