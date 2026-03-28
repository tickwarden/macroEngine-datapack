# macro:geo/region_watch/internal/check_region [MACRO]
# INPUT (from _rw_cur): $(id), $(x1), $(y1), $(z1), $(x2), $(y2), $(z2)
# @s = kontrol edilen oyuncu
# Player coordinates: macro:engine _rw_player.{x,y,z}

# --- AABB test: return early if outside any axis ---
execute store result score $rwx macro.tmp run data get storage macro:engine _rw_player.x
execute store result score $rwy macro.tmp run data get storage macro:engine _rw_player.y
execute store result score $rwz macro.tmp run data get storage macro:engine _rw_player.z

$scoreboard players set $rwx1 macro.tmp $(x1)
$scoreboard players set $rwy1 macro.tmp $(y1)
$scoreboard players set $rwz1 macro.tmp $(z1)
$scoreboard players set $rwx2 macro.tmp $(x2)
$scoreboard players set $rwy2 macro.tmp $(y2)
$scoreboard players set $rwz2 macro.tmp $(z2)

# min/max normalize
execute if score $rwx1 macro.tmp > $rwx2 macro.tmp run scoreboard players operation $rwt macro.tmp = $rwx1 macro.tmp
execute if score $rwx1 macro.tmp > $rwx2 macro.tmp run scoreboard players operation $rwx1 macro.tmp = $rwx2 macro.tmp
execute if score $rwt macro.tmp > $rwx2 macro.tmp run scoreboard players operation $rwx2 macro.tmp = $rwt macro.tmp
execute if score $rwy1 macro.tmp > $rwy2 macro.tmp run scoreboard players operation $rwt macro.tmp = $rwy1 macro.tmp
execute if score $rwy1 macro.tmp > $rwy2 macro.tmp run scoreboard players operation $rwy1 macro.tmp = $rwy2 macro.tmp
execute if score $rwt macro.tmp > $rwy2 macro.tmp run scoreboard players operation $rwy2 macro.tmp = $rwt macro.tmp
execute if score $rwz1 macro.tmp > $rwz2 macro.tmp run scoreboard players operation $rwt macro.tmp = $rwz1 macro.tmp
execute if score $rwz1 macro.tmp > $rwz2 macro.tmp run scoreboard players operation $rwz1 macro.tmp = $rwz2 macro.tmp
execute if score $rwt macro.tmp > $rwz2 macro.tmp run scoreboard players operation $rwz2 macro.tmp = $rwt macro.tmp

# Inside AABB? 1=inside, 0=outside
scoreboard players set $rw_inside macro.tmp 1
execute if score $rwx macro.tmp < $rwx1 macro.tmp run scoreboard players set $rw_inside macro.tmp 0
execute if score $rwx macro.tmp > $rwx2 macro.tmp run scoreboard players set $rw_inside macro.tmp 0
execute if score $rwy macro.tmp < $rwy1 macro.tmp run scoreboard players set $rw_inside macro.tmp 0
execute if score $rwy macro.tmp > $rwy2 macro.tmp run scoreboard players set $rw_inside macro.tmp 0
execute if score $rwz macro.tmp < $rwz1 macro.tmp run scoreboard players set $rw_inside macro.tmp 0
execute if score $rwz macro.tmp > $rwz2 macro.tmp run scoreboard players set $rw_inside macro.tmp 0

# --- State transition ---
# Was inside and still inside → do nothing
$execute if score $rw_inside macro.tmp matches 1 run execute if entity @s[tag=rw.$(id)] run return 0
# Was outside and still outside → do nothing
$execute if score $rw_inside macro.tmp matches 0 run execute unless entity @s[tag=rw.$(id)] run return 0

# --- on_enter: was outside, now inside ---
$execute if score $rw_inside macro.tmp matches 1 run tag @s add rw.$(id)
# DOT NOTATION: _rw_cur.on_enter (space-separated subpath is invalid)
execute if score $rw_inside macro.tmp matches 1 run execute if data storage macro:engine _rw_cur.on_enter run function macro:geo/region_watch/internal/fire_enter with storage macro:engine _rw_cur
execute if score $rw_inside macro.tmp matches 1 run execute if data storage macro:engine _rw_cur.on_enter_cmd run function macro:geo/region_watch/internal/fire_enter_cmd with storage macro:engine _rw_cur
execute if score $rw_inside macro.tmp matches 1 run return 0

# --- on_leave: was inside, now outside ---
$tag @s remove rw.$(id)
execute if data storage macro:engine _rw_cur.on_leave run function macro:geo/region_watch/internal/fire_leave with storage macro:engine _rw_cur
execute if data storage macro:engine _rw_cur.on_leave_cmd run function macro:geo/region_watch/internal/fire_leave_cmd with storage macro:engine _rw_cur
