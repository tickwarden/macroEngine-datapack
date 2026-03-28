# macro:geo/region_watch/internal/player_scan
# @s = kontrol edilecek oyuncu
# Reads coordinates to storage, then iterates all regions.

data modify storage macro:engine _rw_iter set from storage macro:engine region_watches

# Write player coordinates to _rw_player (int truncation, consistent with geo module)
execute store result storage macro:engine _rw_player.x int 1 run data get entity @s Pos[0]
execute store result storage macro:engine _rw_player.y int 1 run data get entity @s Pos[1]
execute store result storage macro:engine _rw_player.z int 1 run data get entity @s Pos[2]

function macro:geo/region_watch/internal/region_loop

data remove storage macro:engine _rw_iter
data remove storage macro:engine _rw_player
