# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/from_input_as
# Execute as a specific selector
#
# INPUT (storage macro:input):
# list → komut listesi
# selector → entity selector (default: @s)
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:input selector run data modify storage macro:input selector set value "@s"

data modify storage macro:engine _mcmd_queue set from storage macro:input list
data modify storage macro:engine _mcmd_options set value {error_mode:"continue",profile:0b,spread:0}

function macro:cmd/other/multi_cmd/internal/run_as_exec with storage macro:input
