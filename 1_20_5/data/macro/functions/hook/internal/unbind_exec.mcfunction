# macro:hook/internal/unbind_exec [MACRO]
# INPUT: $(event)
# Filters all binds belonging to $(event) from hook_binds.

data modify storage macro:engine _hook_unbinds set from storage macro:engine hook_binds
data modify storage macro:engine hook_binds set value []
$data modify storage macro:engine _hook_filter_event set value "$(event)"
function macro:hook/internal/unbind_filter

data remove storage macro:engine _hook_unbinds
data remove storage macro:engine _hook_filter_event

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"hook/unbind ","color":"aqua"},{"text":"$(event)","color":"yellow"},{"text":" removed","color":"#555555"}]
