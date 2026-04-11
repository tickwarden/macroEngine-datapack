# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/step
# Dequeue one command and execute it, then recurse
# ─────────────────────────────────────────────────────────────────

# Return if queue is empty
execute unless data storage macro:engine _mcmd_queue[0] run return 0

# Dequeue first command
data modify storage macro:engine _mcmd_current set from storage macro:engine _mcmd_queue[0]
data remove storage macro:engine _mcmd_queue[0]

# Increment stats counter
execute if data storage macro:engine _mcmd_options{profile:1b} run scoreboard players add $mcmd_total macro.tmp 1

# Execute command (string or object)
execute if data storage macro:engine _mcmd_current{} run function macro:cmd/other/multi_cmd/internal/exec_object
execute unless data storage macro:engine _mcmd_current{} run function macro:cmd/other/multi_cmd/internal/exec_string

# Process next command
function macro:cmd/other/multi_cmd/internal/step
