# macro:wand/internal/unbind_filter
# _wand_unbinds listesinden _wand_filter_tag ile eşleşmeyenleri geri yaz.

execute unless data storage macro:engine _wand_unbinds[0] run return 0

data modify storage macro:engine _wand_cur set from storage macro:engine _wand_unbinds[0]
data remove storage macro:engine _wand_unbinds[0]

function macro:wand/internal/unbind_check with storage macro:engine _wand_cur

function macro:wand/internal/unbind_filter
data remove storage macro:engine _wand_cur
