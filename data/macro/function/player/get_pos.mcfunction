# ============================================
# macro:player/get_pos
# ============================================
# Oyuncunun blok koordinatlarını döndürür.
# Oyuncu çevrimiçi değilse output alanları set edilmez ve found:0b döner.
#
# INPUT: macro:input { player:"<n>" }
# OUTPUT: macro:output { x:<int>, y:<int>, z:<int>, found:1b/0b }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# function macro:player/get_pos with storage macro:input {}
# # → macro:output { x:128, y:64, z:-32, found:1b }
# ============================================

data modify storage macro:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macro:output found set value 1b
$execute as @a[name=$(player),limit=1] at @s store result storage macro:output x int 1 run data get entity @s Pos[0]
$execute as @a[name=$(player),limit=1] at @s store result storage macro:output y int 1 run data get entity @s Pos[1]
$execute as @a[name=$(player),limit=1] at @s store result storage macro:output z int 1 run data get entity @s Pos[2]
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/get_pos ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"dark_gray"},{"text":"x=","color":"gray"},{"storage":"macro:output","nbt":"x","color":"green"},{"text":" y=","color":"gray"},{"storage":"macro:output","nbt":"y","color":"green"},{"text":" z=","color":"gray"},{"storage":"macro:output","nbt":"z","color":"green"}]
