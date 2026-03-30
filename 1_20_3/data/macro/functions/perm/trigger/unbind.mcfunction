$execute unless data storage macro:engine perm_triggers.$(name) run return 0

$data modify storage macro:engine _pt_unbind set from storage macro:engine perm_triggers.$(name)
$data modify storage macro:engine perm_triggers.$(name) set value []
$data modify storage macro:engine _pt_uval set value $(value)
$data modify storage macro:engine _pt_filter_ctx set value {name:"$(name)"}

function macro:perm/trigger/internal/unbind_filter

data remove storage macro:engine _pt_unbind
data remove storage macro:engine _pt_uval
data remove storage macro:engine _pt_filter_ctx
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/trigger/unbind ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(name)","color":"white"},{"text":":","color":"#555555"},{"text":"$(value)","color":"yellow"},{"text":" removed","color":"#555555"}]}
