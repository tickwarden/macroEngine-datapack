execute unless data storage macro:engine trigger_binds run return 0

data modify storage macro:engine _tc_unbind set from storage macro:engine trigger_binds
data modify storage macro:engine trigger_binds set value []

$data modify storage macro:engine _tc_uval set value $(value)
function macro:trigger/internal/unbind_filter
data remove storage macro:engine _tc_unbind
data remove storage macro:engine _tc_uval
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"trigger/unbind ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"value=$(value)","color":"white"},{"text":" removed","color":"#555555"}]
