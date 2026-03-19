# macro:wand/internal/check_next
# Bind listesini iterate et: elindeki item tag'iyle eşleş.

execute unless data storage macro:engine _wand_iter[0] run return 0

data modify storage macro:engine _wand_current set from storage macro:engine _wand_iter[0]
data remove storage macro:engine _wand_iter[0]

function macro:wand/internal/check_item with storage macro:engine _wand_current

function macro:wand/internal/check_next
