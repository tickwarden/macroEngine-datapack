# macro:geo/region_watch/internal/unregister_filter
# Iterates _rw_src list.
# Copies entries whose id does not match _rw_unbind_id to _rw_new.

execute unless data storage macro:engine _rw_src[0] run return 0

data modify storage macro:engine _rw_cur set from storage macro:engine _rw_src[0]
data remove storage macro:engine _rw_src[0]

function macro:geo/region_watch/internal/unregister_check with storage macro:engine _rw_cur

function macro:geo/region_watch/internal/unregister_filter