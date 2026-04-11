# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/from_input
# Execute a simple command list (backward compatible)
#
# INPUT (storage macro:input):
# list → command list ["cmd1", "cmd2", ...]
#
# EXAMPLE:
# data modify storage macro:input list set value ["say Hello", "say World"]
# function macro:cmd/other/multi_cmd/from_input
# ─────────────────────────────────────────────────────────────────

# Copy list to queue
data modify storage macro:engine _mcmd_queue set from storage macro:input list

# Set default options
data modify storage macro:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}

# Execute
function macro:cmd/other/multi_cmd/run

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"multi_cmd/from_input ","color":"aqua"},{"text":"▶ list → run","color":"#555555"}]
