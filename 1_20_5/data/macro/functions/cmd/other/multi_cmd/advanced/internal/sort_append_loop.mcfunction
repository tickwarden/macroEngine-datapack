# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/advanced/internal/sort_append_loop
# Recursive: drain _sort_tmp into _mcmd_queue one item at a time.
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine _sort_tmp[0] run return 0

data modify storage macro:engine _mcmd_queue append from storage macro:engine _sort_tmp[0]
data remove storage macro:engine _sort_tmp[0]

function macro:cmd/other/multi_cmd/advanced/internal/sort_append_loop
