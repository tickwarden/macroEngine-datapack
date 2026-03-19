# macro:wand/internal/unbind_check [MACRO]
# $(tag) mevcut kayıttaki tag. _wand_filter_tag ile eşleşmiyorsa geri ekle.

$execute unless data storage macro:engine {_wand_filter_tag:"$(tag)"} run data modify storage macro:engine wand_binds append from storage macro:engine _wand_cur
