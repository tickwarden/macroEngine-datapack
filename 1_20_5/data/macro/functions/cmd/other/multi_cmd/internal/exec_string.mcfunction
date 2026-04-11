# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/exec_string
# Execute simple string command
# _mcmd_current is a plain string e.g. "say Hello"
# ─────────────────────────────────────────────────────────────────

# Wrap string into object
data modify storage macro:engine _mcmd_exec set value {}
data modify storage macro:engine _mcmd_exec.cmd set from storage macro:engine _mcmd_current

# Execute via macro
function macro:cmd/other/multi_cmd/internal/exec_macro with storage macro:engine _mcmd_exec

# Cleanup
data remove storage macro:engine _mcmd_exec
