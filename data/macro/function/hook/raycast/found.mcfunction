# Blok bulundu!
# Increment hook.placed scoreboard
scoreboard players add @s macro.hook_placed 1

# Write to hook event storage (other systems can listen)
# Save block coordinates (via marker summon from positioned context)
summon minecraft:marker ~ ~ ~ {Tags:["macro.hook_block_pos"]}
execute store result storage macro:hook placed.x int 1 run data get entity @e[type=minecraft:marker,tag=macro.hook_block_pos,limit=1] Pos[0]
execute store result storage macro:hook placed.y int 1 run data get entity @e[type=minecraft:marker,tag=macro.hook_block_pos,limit=1] Pos[1]
execute store result storage macro:hook placed.z int 1 run data get entity @e[type=minecraft:marker,tag=macro.hook_block_pos,limit=1] Pos[2]
kill @e[type=minecraft:marker,tag=macro.hook_block_pos,limit=1]

# Timestamp kaydet (macro.time skorundan)
execute store result storage macro:hook placed.tick int 1 run scoreboard players get #time macro.time

# Get player UUID and name via macroEngine modules
execute as @s run function macro:uuid/from_entity
data modify storage macro:hook placed.uuid set from storage macro:input value

execute as @s run function macro:player/get_name
data modify storage macro:hook placed.name set from storage macro:names temp.NAME
data modify storage macro:hook placed.uuid_array set from storage macro:names temp.UUID

# Hook event flag'ini set et
data modify storage macro:hook placed.active set value 1b

# Hook event sistemine "placed_block" event'i fire et
data modify storage macro:engine _hook_fire_tmp set value {event:"placed_block"}
execute as @s run function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp

# Legacy event system support (if present)
execute if score #m_hook macro.Flags matches 1.. run function macro:event/fire {id:"hook.placed"}

# Cleanup: reset counter
scoreboard players reset @s macro.tmp
