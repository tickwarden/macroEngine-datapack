data modify storage macro:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macro:output found set value 1b
$execute as @a[name=$(player),limit=1] store result storage macro:output result int 1 run data get entity @s Health
$execute as @a[name=$(player),limit=1] store result storage macro:output max int 1 run data get entity @s Attributes[{Name:"minecraft:max_health"}].Base
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/get_health ","color":"aqua"},{"text":"$(player) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"},{"text":"/","color":"#555555"},{"storage":"macro:output","nbt":"max","color":"yellow"}]}
