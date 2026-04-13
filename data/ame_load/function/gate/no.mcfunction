# ame_load:gate/no
# Cancel the pending dangerous command.
#
# Does NOT execute the pending action. Clears pending_gate from storage.
# Idempotent — safe to call multiple times.
#
# ALSO CALLED BY: ame_load:gate/timeout (auto-cancel after 30 seconds)

# Guard: nothing pending
execute unless score #pending ame.gate matches 1 run return 0

# Close the gate window
scoreboard players set #pending ame.gate 0
scoreboard players set #confirmed ame.gate 0

# Cancel the still-pending timeout if admin called /no explicitly
schedule clear ame_load:gate/timeout

# Announce cancellation via marker
summon minecraft:marker ~ ~ ~ {Tags:["macro.gate_no"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run say [AME GATE] Dangerous command CANCELLED. Action was NOT executed.
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run kill @s

# Discard pending context
data remove storage macro:engine pending_gate
scoreboard players reset #pending ame.gate
scoreboard players reset #confirmed ame.gate
scoreboard objectives remove ame.gate
