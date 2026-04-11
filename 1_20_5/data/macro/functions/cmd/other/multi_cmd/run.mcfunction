# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/run
# Execute queued commands
# ─────────────────────────────────────────────────────────────────

# Reset statistics
execute if data storage macro:engine _mcmd_options{profile:1b} run data modify storage macro:engine _mcmd_stats set value {total:0,success:0,failed:0,start_time:0}
execute if data storage macro:engine _mcmd_options{profile:1b} run execute store result storage macro:engine _mcmd_stats.start_time int 1 run time query gametime

# Start recursive stepping
function macro:cmd/other/multi_cmd/internal/step

# Cleanup
function macro:cmd/other/multi_cmd/internal/cleanup

# Show statistics
execute if data storage macro:engine _mcmd_options{profile:1b} run function macro:cmd/other/multi_cmd/internal/show_stats

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"multi_cmd/run ","color":"aqua"},{"text":"✔ batch done","color":"green"}]
