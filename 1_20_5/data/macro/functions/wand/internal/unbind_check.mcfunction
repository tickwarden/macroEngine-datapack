# macro:wand/internal/unbind_check [MACRO]
# $(tag) is the tag of the current record. Add back if it does not match _wand_filter_tag.

$execute unless data storage macro:engine {_wand_filter_tag:"$(tag)"} run data modify storage macro:engine wand_binds append from storage macro:engine _wand_cur
