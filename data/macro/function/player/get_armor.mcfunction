# ─────────────────────────────────────────────────────────────────
# macro:player/get_armor
# Returns the armor point value of the named player.
# Armor is read from the generic.armor attribute base value.
# Also returns armor toughness.
#
# INPUT : $(player) → player name
# OUTPUT: macro:output result    → armor points (int)
#         macro:output toughness → armor toughness (int, scaled ×1000)
#         macro:output found     → 1b if player exists, 0b otherwise
#
# EXAMPLE:
#   function macro:player/get_armor {player:"Steve"}
#   data get storage macro:output result
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macro:output found set value 1b
$execute as @a[name=$(player),limit=1] store result storage macro:output result int 1 run data get entity @s Attributes[{Name:"minecraft:armor"}].Base
$execute as @a[name=$(player),limit=1] store result storage macro:output toughness int 1000 run data get entity @s Attributes[{Name:"minecraft:armor_toughness"}].Base
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/get_armor ","color":"aqua"},{"text":"$(player) → armor=","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"},{"text":" toughness=","color":"gray"},{"storage":"macro:output","nbt":"toughness","color":"green"}]
