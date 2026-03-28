# macroEngine Rate Limit - Admin Alert
# Internal: Alert admins when player has excessive violations
# Context: @s = Player with high violation count

# Alert all admins
execute as @a[tag=macro.admin] run tellraw @s ["",{"text":"[Rate Limit Alert] ","color":"red","bold":true},{"selector":"@s","color":"white"},{"text":" has ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_violations"},"color":"red","bold":true},{"text":" violations!","color":"gray"}]

# Play alert sound to admins
execute as @a[tag=macro.admin] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2

# Log to debug
tellraw @a[tag=macro.debug] ["",{"text":"[Rate Limit] ","color":"yellow"},{"text":"Abuse detected: ","color":"gray"},{"selector":"@s","color":"white"},{"text":" | Violations: ","color":"gray"},{"score":{"name":"@s","objective":"macro.rl_violations"},"color":"red"}]

return 0
