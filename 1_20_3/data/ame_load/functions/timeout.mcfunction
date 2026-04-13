# ame_load:timeout
# Fires 5 minutes after ame_load:load/confirm if no admin response.
#
# Uses the marker say pattern so the log message appears even when
# zero players are online (unlike tellraw @a).
#
# Delegates to ame_load:load/no which is idempotent — if the admin
# already ran /yes or /no, the #pending guard in load/no returns 0
# and nothing happens.

summon minecraft:marker ~ ~ ~ {Tags:["macro.timeout"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.timeout,limit=1] run say [AME GATE] Timeout — no admin response in 5 minutes. Auto-cancelling.
execute as @e[type=minecraft:marker,tag=macro.timeout,limit=1] run kill @s

# Delegate to load/no (idempotent — no-op if gate already closed)
execute if score #pending ame.load matches 1 run function ame_load:load/no
