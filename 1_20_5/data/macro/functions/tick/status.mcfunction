# macro:tick/status — Show tick engine diagnostics
tellraw @s [{"text":"","extra":[{"text":"══ AME Tick Engine v2 ══","color":"gold","bold":true}]}]
tellraw @s [{"text":" Counter ","color":"gray"},{"score":{"name":"#tick_ctr","objective":"macro.tick"},"color":"aqua"}]
tellraw @s [{"text":" Paused ","color":"gray"},{"storage":"macro:engine","nbt":"tick.paused","color":"red"}]
tellraw @s [{"text":" Channels","color":"gray"}]
tellraw @s {"storage":"macro:engine","nbt":"tick.channels","color":"yellow"}