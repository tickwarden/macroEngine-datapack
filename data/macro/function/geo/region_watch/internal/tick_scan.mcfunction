# macro:geo/region_watch/internal/tick_scan
# Called from hook/internal/tick_scan (requires patch).
# If region_watches is non-empty, checks all regions for each player.

execute unless data storage macro:engine region_watches run return 0

data modify storage macro:engine _rw_watch_list set from storage macro:engine region_watches
execute as @a run function macro:geo/region_watch/internal/player_scan
data remove storage macro:engine _rw_watch_list
