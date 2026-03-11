# ============================================
# macro:lib/for_each_list
# ============================================
# Runs a function for each element of a storage list.
#
# BUG FIX v2.0.2: Replaced flat _felist_input/_felist_state globals with a
# proper stack frame system (_felist_stack). Each call pushes a frame
# {func, list, i} before iterating and pops it on return. Nested calls
# (i.e. calling for_each_list again from inside the callback) are now safe —
# each recursion level works from its own top-of-stack frame without
# clobbering the outer loop's state.
#
# USAGE:
# 1. Copy the list into _felist_input (same as before — API unchanged):
#    data modify storage macro:engine _felist_input set from storage <source> <path>
# 2. Call with func:
#    data modify storage macro:input func set value "mypack:loop/item_step"
#    function macro:lib/for_each_list with storage macro:input {}
#
# On each iteration the following are available (same as before):
#   macro:engine _felist_current → current element
#   macro:engine _felist_i       → current index (int, starts at 0)
#
# NOTE: Modifying _felist_input inside func is now harmless (it is moved into
# the stack frame before iteration begins), but still not recommended.
#
# EXAMPLE:
# data modify storage macro:engine _felist_input set value ["elma","armut","kiraz"]
# data modify storage macro:input func set value "mypack:give/fruit"
# function macro:lib/for_each_list with storage macro:input {}
# ============================================

# ─── Push new stack frame ────────────────────────────────────────────────────
# Frame structure: { func: "...", list: [...], i: 0 }
$data modify storage macro:engine _felist_stack append value {func:"$(func)", i:0}
# Move caller-prepared _felist_input into the frame's list field
data modify storage macro:engine _felist_stack[-1].list set from storage macro:engine _felist_input
data remove storage macro:engine _felist_input

# ─── Iterate ─────────────────────────────────────────────────────────────────
function macro:lib/internal/for_each_list_step

# ─── Pop frame ───────────────────────────────────────────────────────────────
data remove storage macro:engine _felist_stack[-1]

# ─── Expose last-seen index/element for post-loop introspection ──────────────
# (Cleared so stale values don't leak to caller — matches previous behaviour.)
data remove storage macro:engine _felist_current
data remove storage macro:engine _felist_i

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/for_each_list ","color":"aqua"},{"text":" → ","color":"dark_gray"},{"text":"$(func)","color":"aqua"}]
