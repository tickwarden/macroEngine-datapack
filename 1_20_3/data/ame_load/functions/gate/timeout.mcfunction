# ame_load:gate/timeout
# Fires 30 seconds after ame_load:gate/request if no admin response.
#
# Delegates to ame_load:gate/no which is idempotent — if the gate was
# already closed by an explicit /yes or /no, the #pending guard in
# gate/no returns 0 and nothing happens.

summon minecraft:marker ~ ~ ~ {Tags:["macro.gtimeout"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.gtimeout,limit=1] run say [AME GATE] Dangerous command timeout (30s) — auto-cancelling.
execute as @e[type=minecraft:marker,tag=macro.gtimeout,limit=1] run kill @s

execute if score #pending ame.gate matches 1 run function ame_load:gate/no
