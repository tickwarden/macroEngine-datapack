# macro:geo/region_watch/internal/unregister_exec [MACRO]
# INPUT: $(id)
# region_watches in list format — always run filter,
# if id not found, list remains unchanged.

execute unless data storage macro:engine region_watches run return 0

data modify storage macro:engine _rw_unbind_id set from storage macro:input id
data modify storage macro:engine _rw_new set value []
data modify storage macro:engine _rw_src set from storage macro:engine region_watches
function macro:geo/region_watch/internal/unregister_filter
data modify storage macro:engine region_watches set from storage macro:engine _rw_new
data remove storage macro:engine _rw_new
data remove storage macro:engine _rw_src
data remove storage macro:engine _rw_unbind_id

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/region_watch/unregister ","color":"aqua"},{"text":"$(id)","color":"white"},{"text":" removed","color":"#555555"}]
