# ─────────────────────────────────────────────────────────────────
# macro:wand/unregister
# Removes all wand binds belonging to a specific tag.
#
# INPUT:
#   $(tag) → tag to remove
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine wand_binds run return 0

data modify storage macro:engine _wand_unbinds set from storage macro:engine wand_binds
data modify storage macro:engine wand_binds set value []
$data modify storage macro:engine _wand_filter_tag set value "$(tag)"
function macro:wand/internal/unbind_filter
data remove storage macro:engine _wand_unbinds
data remove storage macro:engine _wand_filter_tag
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/unregister ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(tag)","color":"white"},{"text":" removed","color":"#555555"}]
