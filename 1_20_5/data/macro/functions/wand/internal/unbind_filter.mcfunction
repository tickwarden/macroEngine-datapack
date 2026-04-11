# macro:wand/internal/unbind_filter
# Write back entries from _wand_unbinds that do not match _wand_filter_tag.

execute unless data storage macro:engine _wand_unbinds[0] run return 0

data modify storage macro:engine _wand_cur set from storage macro:engine _wand_unbinds[0]
data remove storage macro:engine _wand_unbinds[0]

function macro:wand/internal/unbind_check with storage macro:engine _wand_cur

function macro:wand/internal/unbind_filter
data remove storage macro:engine _wand_cur
