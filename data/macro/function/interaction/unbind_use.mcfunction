execute unless data storage macro:engine interaction_binds.use[0] run return 0

data modify storage macro:engine _ia_ubinds set from storage macro:engine interaction_binds.use
data modify storage macro:engine interaction_binds.use set value []
$data modify storage macro:engine _ia_ufilter set value {tag:"$(tag)", func:"$(func)", list:"use"}
function macro:interaction/internal/unbind_filter
data remove storage macro:engine _ia_ubinds
data remove storage macro:engine _ia_ufilter

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/unbind_use ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(tag)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
