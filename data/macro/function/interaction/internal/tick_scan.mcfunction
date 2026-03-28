execute unless entity @e[type=minecraft:interaction,tag=macro.interaction,limit=1] run return 0

execute if data storage macro:engine interaction_binds.attack[0] run execute as @e[type=minecraft:interaction,tag=macro.interaction] if data entity @s attack run function macro:interaction/internal/on_attack

execute if data storage macro:engine interaction_binds.use[0] run execute as @e[type=minecraft:interaction,tag=macro.interaction] if data entity @s interaction run function macro:interaction/internal/on_use
