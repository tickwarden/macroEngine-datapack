# ─────────────────────────────────────────────────────────────────
# macro:player/is_burning
# Checks whether a named player is currently on fire.
# Uses the macro:is_burning predicate (entity_flags).
#
# INPUT : $(player) → player name
# OUTPUT: macro:output result → 1b if burning, 0b otherwise
# macro:output found → 1b if player online, 0b otherwise
#
# EXAMPLE:
# function macro:player/is_burning {player:"Steve"}
# → macro:output result = 1b
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output found set value 0b
data modify storage macro:output result set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macro:output found set value 1b
$execute as @a[name=$(player),limit=1] if predicate macro:is_burning run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/is_burning ","color":"aqua"},{"text":"$(player) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
