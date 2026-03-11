# ============================================
# macro:lib/for_each_list
# ============================================
# Runs a function for each element of a storage list.
#
# USAGE:
# 1. Copy the list into _felist_input:
# data modify storage macro:engine _felist_input set from storage <source> <yol>
# 2. Call the function:
# data modify storage macro:input func set value "mypack:loop/item_step"
# function macro:lib/for_each_list with storage macro:input {}
#
# On each iteration erisviabilir:
# macro:engine _felist_current → current element
# macro:engine _felist_i → current index (starts at 0, int)
#
# NOTE: do not modify _felist_input inside func — the iterator will break.
#
# EXAMPLE:
# data modify storage macro:engine _felist_input set value ["elma","armut","kiraz"]
# data modify storage macro:input func set value "mypack:give/fruit"
# function macro:lib/for_each_list with storage macro:input {}
# ============================================

$data modify storage macro:engine _felist_state set value {func:"$(func)"}
scoreboard players set $felist_i macro.tmp 0
function macro:lib/internal/for_each_list_step

# Clear
data remove storage macro:engine _felist_input
data remove storage macro:engine _felist_state
data remove storage macro:engine _felist_current
data remove storage macro:engine _felist_i
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/for_each_list ","color":"aqua"},{"text":" → ","color":"dark_gray"},{"text":"$(func)","color":"aqua"}]
