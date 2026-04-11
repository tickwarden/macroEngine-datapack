# ─────────────────────────────────────────────────────────────────
# macro:world/get_time
# Reads the current world time and writes it to macro:output.
#
# OUTPUT: macro:output daytime → ticks within the current day (0–23999)
# macro:output total → total world age in ticks (never resets)
# macro:output day → current in-game day number
#
# EXAMPLE:
# function macro:world/get_time
# data get storage macro:output daytime
# ─────────────────────────────────────────────────────────────────

execute store result storage macro:output daytime int 1 run time query daytime
execute store result storage macro:output total int 1 run time query gametime
execute store result storage macro:output day int 1 run time query day
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"world/get_time ","color":"aqua"},{"text":"day=","color":"gray"},{"storage":"macro:output","nbt":"day","color":"green"},{"text":" daytime=","color":"gray"},{"storage":"macro:output","nbt":"daytime","color":"green"}]
