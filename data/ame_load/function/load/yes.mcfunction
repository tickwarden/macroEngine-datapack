# ame_load:load/yes
# Admin confirmed AME load. Triggers the full initialization pipeline.
#
# GUARDS
# ------
#   - Gate must be open (#pending ame.load == 1)
#   - Already-confirmed calls are no-ops (idempotent)
#   - If called with no gate pending, silently returns 0
#
# WHAT HAPPENS
# ------------
#   1. Mark confirmed, close the pending window
#   2. Cancel the 5-minute timeout schedule
#   3. Tear down the ame.load objective (not needed after this point)
#   4. Schedule ame_load:load/all at t+1 (clean tick boundary)
#
# The 1-tick delay lets the scoreboard objective removal settle before
# ame_load:load/scoreboards runs and recreates its own objectives.

# Guard: no gate open
execute unless score #pending ame.load matches 1 run return 0

# Guard: already confirmed (double-call protection)
execute if score #confirmed ame.load matches 1 run return 0

# Mark confirmed — close window
scoreboard players set #confirmed ame.load 1
scoreboard players set #pending ame.load 0

# Cancel auto-cancel timeout
schedule clear ame_load:timeout

# Announce via marker (safe on all MC versions, no player context needed)
summon minecraft:marker ~ ~ ~ {Tags:["macro.gate_yes"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.gate_yes,limit=1] run say [AME GATE] Load CONFIRMED by operator. Initializing macroEngine...
execute as @e[type=minecraft:marker,tag=macro.gate_yes,limit=1] run kill @s

# Tear down gate scoreboard before load pipeline touches scoreboards
scoreboard players reset #pending ame.load
scoreboard players reset #confirmed ame.load
scoreboard players reset #cancelled ame.load
scoreboard objectives remove ame.load

# Fire the actual load pipeline
# 1-tick delay gives scoreboard removal a clean tick boundary before
# ame_load:load/scoreboards recreates its objectives
schedule function ame_load:load/all 1t replace