execute if data storage macro:engine global{loaded:1b} run return 0

execute unless entity @a run return run function macro:load

tellraw @a {"text":"⚠ Warning: Bu dunya deneysel ozellikler iceriyor. You can load it with /function macro:load.","color":"yellow"}
