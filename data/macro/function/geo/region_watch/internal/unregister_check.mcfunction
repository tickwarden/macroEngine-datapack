# macro:geo/region_watch/internal/unregister_check [MACRO]
# INPUT: $(id) — _rw_cur'dan beslenir
# If id does not match, add to _rw_new (keep).

$execute unless data storage macro:engine {_rw_unbind_id:"$(id)"} run data modify storage macro:engine _rw_new append from storage macro:engine _rw_cur
