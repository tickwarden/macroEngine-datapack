# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/exec_object
# Execute advanced object command
# _mcmd_current format: {cmd:"...", condition:{}, priority:0}
# ─────────────────────────────────────────────────────────────────

# Check condition (if present)
execute if data storage macro:engine _mcmd_current.condition run function macro:cmd/other/multi_cmd/internal/check_condition
execute if data storage macro:engine _mcmd_current.condition if score $mcmd_cond_result macro.tmp matches 0 run return 0

# Run pre-hook (if present)
execute if data storage macro:engine _mcmd_current.pre_hook run function macro:cmd/other/multi_cmd/internal/run_pre_hook

# Start profiling (if present)
execute if data storage macro:engine _mcmd_options{profile:1b} run execute store result score $mcmd_exec_start macro.tmp run time query gametime

# Execute command
execute if data storage macro:engine _mcmd_current.cmd run function macro:cmd/other/multi_cmd/internal/exec_macro with storage macro:engine _mcmd_current
execute if data storage macro:engine _mcmd_current.func run function macro:cmd/other/multi_cmd/internal/exec_func_macro with storage macro:engine _mcmd_current

# End profiling (if present)
execute if data storage macro:engine _mcmd_options{profile:1b} run function macro:cmd/other/multi_cmd/internal/record_exec_time

# Run post-hook (if present)
execute if data storage macro:engine _mcmd_current.post_hook run function macro:cmd/other/multi_cmd/internal/run_post_hook

# Track stats
execute if data storage macro:engine _mcmd_options{profile:1b} run scoreboard players add $mcmd_success macro.tmp 1
