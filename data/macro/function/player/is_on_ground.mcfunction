# ─────────────────────────────────────────────────────────────────
# macro:player/is_on_ground
# Checks whether a named player is currently on the ground.
# Uses the macro:is_on_ground predicate (entity_flags).
#
# INPUT : $(player) → player name
# OUTPUT: macro:output result → 1b if on ground, 0b otherwise
#         macro:output found  → 1b if player online, 0b otherwise
#
# EXAMPLE:
#   function macro:player/is_on_ground {player:"Steve"}
#   → macro:output result = 1b
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output found set value 0b
data modify storage macro:output result set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macro:output found set value 1b
$execute as @a[name=$(player),limit=1] if predicate macro:is_on_ground run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/is_on_ground ","color":"aqua"},{"text":"$(player) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
