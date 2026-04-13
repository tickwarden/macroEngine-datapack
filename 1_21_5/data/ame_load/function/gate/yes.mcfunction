# ame_load:gate/yes
# Execute the pending dangerous command after admin confirmation.
#
# Reads the pending_gate compound from macro:engine storage and dispatches
# to the correct executor based on the 'type' field.
#
# SUPPORTED TYPES
# ---------------
#   "ban"     → ame_load:gate/exec/ban       (macro: player, reason)
#   "ban_ip"  → ame_load:gate/exec/ban_ip    (macro: player, reason)
#   "disable" → ame_load:gate/exec/disable   (no macro params)
#
# Adding new types: write an executor in ame_load:gate/exec/, then add
# an 'execute if data' dispatch line here.

# Guard: no gate open
execute unless score #pending ame.gate matches 1 run return 0

# Guard: already confirmed (double-call protection)
execute if score #confirmed ame.gate matches 1 run return 0

# Mark confirmed, close window
scoreboard players set #confirmed ame.gate 1
scoreboard players set #pending ame.gate 0

# Cancel the 30-second timeout
schedule clear ame_load:gate/timeout

# Announce execution via marker
summon minecraft:marker ~ ~ ~ {Tags:["macro.gate_exec"],CustomName:{"text":"AME"}}
execute as @e[type=minecraft:marker,tag=macro.gate_exec,limit=1] run say [AME GATE] Dangerous command CONFIRMED. Executing...
execute as @e[type=minecraft:marker,tag=macro.gate_exec,limit=1] run kill @s

# --- DISPATCH ---
# Each executor reads its own fields from macro:engine pending_gate via macro.
# The 'with storage' pattern passes pending_gate fields as $(macro) parameters.

# ban: requires {type:"ban", player:"...", reason:"..."}
execute if data storage macro:engine pending_gate{type:"ban"} run function ame_load:gate/exec/ban with storage macro:engine pending_gate

# ban_ip: requires {type:"ban_ip", player:"...", reason:"..."}
execute if data storage macro:engine pending_gate{type:"ban_ip"} run function ame_load:gate/exec/ban_ip with storage macro:engine pending_gate

# disable: requires {type:"disable"} (no extra fields)
execute if data storage macro:engine pending_gate{type:"disable"} run function ame_load:gate/exec/disable

# --- CLEANUP ---
data remove storage macro:engine pending_gate
scoreboard players reset #pending ame.gate
scoreboard players reset #confirmed ame.gate
scoreboard objectives remove ame.gate
