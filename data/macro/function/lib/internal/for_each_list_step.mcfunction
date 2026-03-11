# for_each_list internal step — operates on top of _felist_stack
# Called recursively until the top frame's list is exhausted.

# Nothing left in the top frame → done
execute unless data storage macro:engine _felist_stack[-1].list[0] run return 0

# ─── Expose current element and index ────────────────────────────────────────
data modify storage macro:engine _felist_current set from storage macro:engine _felist_stack[-1].list[0]
execute store result storage macro:engine _felist_i int 1 run data get storage macro:engine _felist_stack[-1].i

# ─── Call user function ───────────────────────────────────────────────────────
function macro:lib/internal/for_each_list_call with storage macro:engine _felist_stack[-1]

# ─── Advance: consume element, increment i in frame ─────────────────────────
data remove storage macro:engine _felist_stack[-1].list[0]

# Increment i stored inside the stack frame
execute store result score $feli_tmp macro.tmp run data get storage macro:engine _felist_stack[-1].i
scoreboard players add $feli_tmp macro.tmp 1
execute store result storage macro:engine _felist_stack[-1].i int 1 run scoreboard players get $feli_tmp macro.tmp

# ─── Next element ─────────────────────────────────────────────────────────────
function macro:lib/internal/for_each_list_step
