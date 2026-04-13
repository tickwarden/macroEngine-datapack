# ame_load:load/no
# Admin cancelled (or timeout fired) — AME load is ABORTED.
#
# macro:engine storage is NOT touched at any point.
# The engine remains uninitialized and fully inert.
#
# IDEMPOTENT — safe to call multiple times.
# The #pending guard ensures this is a no-op if no gate is open.
#
# ALSO CALLED BY: ame_load:timeout (auto-cancel after 5 minutes)
#
# TO RETRY: run /reload  OR  /function ame_load:_
# (calling ame_load:_ directly re-runs stage0 without a full /reload)

# Guard: nothing pending
execute unless score #pending ame.load matches 1 run return 0

# Close the gate window
scoreboard players set #cancelled ame.load 1
scoreboard players set #pending ame.load 0
scoreboard players set #confirmed ame.load 0

# If admin called /no explicitly, cancel the still-pending timeout
schedule clear ame_load:timeout

# Announce cancellation via marker (works with zero players online)
summon minecraft:marker ~ ~ ~ {Tags:["macro.gate_no"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run say [AME GATE] ========================================
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run say [AME GATE] Load CANCELLED. macro:engine storage was NOT modified.
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run say [AME GATE] Engine is NOT running.
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run say [AME GATE] To retry: /reload  or  /function ame_load:_
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run say [AME GATE] ========================================
execute as @e[type=minecraft:marker,tag=macro.gate_no,limit=1] run kill @s

# Tear down gate objective
scoreboard players reset #pending ame.load
scoreboard players reset #cancelled ame.load
scoreboard players reset #confirmed ame.load
scoreboard objectives remove ame.load
