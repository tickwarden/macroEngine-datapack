# macro:geo/region_watch/internal/region_loop
# @s = kontrol edilen oyuncu
# Consumes _rw_iter list, calls check_region for each region.

execute unless data storage macro:engine _rw_iter[0] run return 0

data modify storage macro:engine _rw_cur set from storage macro:engine _rw_iter[0]
data remove storage macro:engine _rw_iter[0]

function macro:geo/region_watch/internal/check_region with storage macro:engine _rw_cur

function macro:geo/region_watch/internal/region_loop
