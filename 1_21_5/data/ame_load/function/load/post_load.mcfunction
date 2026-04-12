# Stage 4 — post_load: schedule #macro:init after AME finishes loading
# ame_load:load/all is scheduled at t+16 (from Stage 0 in ame_load:_).
# Firing #macro:init at t+20 gives 4 ticks of margin after AME is fully ready.
summon minecraft:marker ~ ~ ~ {Tags:["macro.stage4"],CustomName:{"text":"AME"}}
execute as @e[type=minecraft:marker,tag=macro.stage4,limit=1] run say Scheduling #macro:init (t+20)...
execute as @e[type=minecraft:marker,tag=macro.stage4,limit=1] run schedule function #macro:init 20t replace
execute as @e[type=minecraft:marker,tag=macro.stage4,limit=1] run kill @s
