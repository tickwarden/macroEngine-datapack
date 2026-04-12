# Stage 0 Load
summon minecraft:marker ~ ~ ~ {Tags:["macro.stage0"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.stage0,limit=1] run say Loading macroEngine...
execute as @e[type=minecraft:marker,tag=macro.stage0,limit=1] run schedule function ame_load:load/all 16t replace
execute as @e[type=minecraft:marker,tag=macro.stage0,limit=1] run kill @s
