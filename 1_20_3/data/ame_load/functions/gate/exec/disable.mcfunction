# ame_load:gate/exec/disable
# Executor for confirmed engine disable.
# Called by ame_load:gate/yes when pending_gate{type:"disable"}.
#
# Runs the full cleanup pipeline then announces shutdown via marker.
# No macro parameters needed.

function ame_load:load/internal/cleanup

summon minecraft:marker ~ ~ ~ {Tags:["macro.gate_disable"],CustomName:'{"text":"AME"}'}
execute as @e[type=minecraft:marker,tag=macro.gate_disable,limit=1] run say [AME] Engine DISABLED. All scoreboards and storage removed.
execute as @e[type=minecraft:marker,tag=macro.gate_disable,limit=1] run say [AME] To reinitialize: /reload  or  /function ame_load:_
execute as @e[type=minecraft:marker,tag=macro.gate_disable,limit=1] run kill @s
