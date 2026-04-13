# ame_load:_ — Stage 0 Load Entry Point
#
# This is the ONLY function registered in the minecraft:load function tag.
# It does NOT load macroEngine directly.
#
# Instead it spawns a one-shot marker entity (to ensure a stable execution
# context regardless of server-startup state), delegates to the load gate,
# then kills itself. Nothing in macro:engine storage is touched here.
#
# WHY MARKER ENTITY PATTERN:
#   - Server startup context is unreliable for tellraw/clickEvent rendering.
#   - Marker 'say' commands appear in the server log even with zero players online.
#   - Gives a deterministic @s context (not @a, not @p, not server console).
#   - One-shot: spawned here, killed by the end of the same function.
#
# WHY DEFERRED LOAD (GATE SYSTEM):
#   - minecraft:load fires on /reload AND on world open.
#   - If macro:engine storage contains live data from a prior session
#     (permissions, flags, wand binds, etc.), any unconditional storage write
#     causes silent overwrites and nondeterministic engine state.
#   - The gate requires explicit admin confirmation before any storage touch.
#
# CONFIRMING:  /function ame_load:load/yes
# CANCELLING:  /function ame_load:load/no
# AUTO-CANCEL: fires after 5 minutes if no response

summon minecraft:marker ~ ~ ~ {Tags:["macro.stage0"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.stage0,limit=1] run function ame_load:load/confirm
execute as @e[type=minecraft:marker,tag=macro.stage0,limit=1] run kill @s
