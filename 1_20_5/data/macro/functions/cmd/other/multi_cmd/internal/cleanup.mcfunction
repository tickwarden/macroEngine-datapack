# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/cleanup
# Cleanup — remove temporary storages
# ─────────────────────────────────────────────────────────────────

data remove storage macro:engine _mcmd_queue
data remove storage macro:engine _mcmd_current
data remove storage macro:engine _mcmd_exec
data remove storage macro:engine _mcmd_cond_tmp

# Sort temporaries (no-op if sort was not used)
data remove storage macro:engine _sort_neg
data remove storage macro:engine _sort_zero
data remove storage macro:engine _sort_pos
data remove storage macro:engine _sort_buf
data remove storage macro:engine _sort_tmp
data remove storage macro:engine _sort_cur

scoreboard players reset $mcmd_cond_result macro.tmp
scoreboard players reset $mcmd_cond_score macro.tmp
scoreboard players reset $sort_pri macro.tmp
