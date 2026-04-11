# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/show_stats
# Show statistics
# ─────────────────────────────────────────────────────────────────

execute store result score $mcmd_end_time macro.tmp run time query gametime
execute store result score $mcmd_duration macro.tmp run data get storage macro:engine _mcmd_stats.start_time
scoreboard players operation $mcmd_duration macro.tmp = $mcmd_end_time macro.tmp
scoreboard players operation $mcmd_duration macro.tmp -= $mcmd_duration macro.tmp

execute store result storage macro:engine _mcmd_stats.total int 1 run scoreboard players get $mcmd_total macro.tmp
execute store result storage macro:engine _mcmd_stats.success int 1 run scoreboard players get $mcmd_success macro.tmp
execute store result storage macro:engine _mcmd_stats.duration int 1 run scoreboard players get $mcmd_duration macro.tmp

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"multi_cmd/stats ","color":"aqua"},{"text":"Total: ","color":"#555555"},{"nbt":"_mcmd_stats.total","storage":"macro:engine","color":"white"},{"text":" | Success: ","color":"#555555"},{"nbt":"_mcmd_stats.success","storage":"macro:engine","color":"green"},{"text":" | Duration: ","color":"#555555"},{"nbt":"_mcmd_stats.duration","storage":"macro:engine","color":"yellow"},{"text":"t","color":"yellow"}]

scoreboard players reset $mcmd_total macro.tmp
scoreboard players reset $mcmd_success macro.tmp
scoreboard players reset $mcmd_duration macro.tmp
scoreboard players reset $mcmd_end_time macro.tmp
data remove storage macro:engine _mcmd_stats
