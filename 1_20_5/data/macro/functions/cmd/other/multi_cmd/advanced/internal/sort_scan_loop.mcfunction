# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/advanced/internal/sort_scan_loop
# Recursive: dequeue one item from _sort_buf and classify it.
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine _sort_buf[0] run return 0

data modify storage macro:engine _sort_cur set from storage macro:engine _sort_buf[0]
data remove storage macro:engine _sort_buf[0]

# Read priority into scoreboard — returns 0 if field absent (desired default)
execute store result score $sort_pri macro.tmp run data get storage macro:engine _sort_cur.priority

execute if score $sort_pri macro.tmp matches ..-1 run data modify storage macro:engine _sort_neg append from storage macro:engine _sort_cur
execute if score $sort_pri macro.tmp matches 0 run data modify storage macro:engine _sort_zero append from storage macro:engine _sort_cur
execute if score $sort_pri macro.tmp matches 1.. run data modify storage macro:engine _sort_pos append from storage macro:engine _sort_cur

scoreboard players reset $sort_pri macro.tmp

function macro:cmd/other/multi_cmd/advanced/internal/sort_scan_loop
