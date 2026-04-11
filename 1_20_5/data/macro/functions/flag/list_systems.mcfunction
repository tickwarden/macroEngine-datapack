# macro:flag/list_systems — List all tick channels with their current config
tellraw @s [{"text":"[AME] Tick Channels","color":"gold","bold":true}]
tellraw @s {"storage":"macro:engine","nbt":"tick.channels","color":"yellow"}