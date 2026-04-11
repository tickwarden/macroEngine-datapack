# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/run_func
# Run function list
#
# INPUT (storage macro:input):
# list → function list ["pack:func1", "pack:func2"]
# ─────────────────────────────────────────────────────────────────

# Convert strings to {func:"..."} format
data modify storage macro:engine _mcmd_queue set value []
function macro:cmd/other/multi_cmd/internal/func_convert_loop

data modify storage macro:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}
function macro:cmd/other/multi_cmd/run

data remove storage macro:engine _mcmd_func_tmp
