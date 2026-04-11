# macro:wand/internal/check_next
# Iterate bind list: match the tag of the held item.

execute unless data storage macro:engine _wand_iter[0] run return 0

data modify storage macro:engine _wand_current set from storage macro:engine _wand_iter[0]
data remove storage macro:engine _wand_iter[0]

function macro:wand/internal/check_item with storage macro:engine _wand_current

function macro:wand/internal/check_next
