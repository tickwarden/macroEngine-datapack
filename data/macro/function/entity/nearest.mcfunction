# ─────────────────────────────────────────────────────────────────
# macro:entity/nearest
# Finds the nearest entity of a given type to the named player and
# runs the given function as that entity (at its position).
# If no entity of the type exists within radius, does nothing.
#
# INPUT : $(player) → player name (origin)
#         $(type)   → entity type (e.g. "minecraft:zombie")
#         $(radius) → search radius in blocks
#         $(func)   → function to run as the nearest entity
# ─────────────────────────────────────────────────────────────────

$execute as @a[name=$(player),limit=1] at @s run execute as @e[type=$(type),sort=nearest,limit=1,distance=..$(radius)] at @s run function $(func)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/nearest ","color":"aqua"},{"text":"$(player) → ","color":"gray"},{"text":"$(type) r=$(radius)","color":"aqua"}]
