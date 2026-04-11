# macro:math/atan2 [MACRO]
# Integer atan2 — returns angle in degrees × 1000 (range: -180000..180000)
# Uses octant decomposition + lookup table (same scale as sin/cos: ×1000)
#
# INPUT:  $(y), $(x)  — integer coordinates (scaled consistently)
# OUTPUT: macro:output result — degrees × 1000
#
# EXAMPLE:
# function macro:math/atan2 {y:500, x:500}
# → result = 45000 (45.000°)
#
# NOTES:
# - Both x and y zero → result = 0
# - Result matches standard math convention (CCW from +X axis)

$scoreboard players set $a2_y macro.tmp $(y)
$scoreboard players set $a2_x macro.tmp $(x)

# Determine quadrant sign flags
scoreboard players set $a2_sx macro.tmp 1
scoreboard players set $a2_sy macro.tmp 1
execute if score $a2_x macro.tmp matches ..-1 run scoreboard players set $a2_sx macro.tmp -1
execute if score $a2_y macro.tmp matches ..-1 run scoreboard players set $a2_sy macro.tmp -1

# Work in absolute values
scoreboard players set $a2_ax macro.tmp 0
scoreboard players set $a2_ay macro.tmp 0
execute store result score $a2_ax macro.tmp run scoreboard players get $a2_x macro.tmp
execute if score $a2_ax macro.tmp matches ..-1 run scoreboard players operation $a2_ax macro.tmp *= $a2_sx macro.tmp
execute store result score $a2_ay macro.tmp run scoreboard players get $a2_y macro.tmp
execute if score $a2_ay macro.tmp matches ..-1 run scoreboard players operation $a2_ay macro.tmp *= $a2_sy macro.tmp

# Handle degenerate cases
execute if score $a2_ax macro.tmp matches 0 if score $a2_ay macro.tmp matches 0 run data modify storage macro:output result set value 0
execute if score $a2_ax macro.tmp matches 0 if score $a2_ay macro.tmp matches 0 run return 0

execute if score $a2_ax macro.tmp matches 0 if score $a2_sy macro.tmp matches 1 run data modify storage macro:output result set value 90000
execute if score $a2_ax macro.tmp matches 0 if score $a2_sy macro.tmp matches 1 run return 0
execute if score $a2_ax macro.tmp matches 0 if score $a2_sy macro.tmp matches -1 run data modify storage macro:output result set value -90000
execute if score $a2_ax macro.tmp matches 0 if score $a2_sy macro.tmp matches -1 run return 0

execute if score $a2_ay macro.tmp matches 0 if score $a2_sx macro.tmp matches 1 run data modify storage macro:output result set value 0
execute if score $a2_ay macro.tmp matches 0 if score $a2_sx macro.tmp matches 1 run return 0
execute if score $a2_ay macro.tmp matches 0 if score $a2_sx macro.tmp matches -1 run data modify storage macro:output result set value 180000
execute if score $a2_ay macro.tmp matches 0 if score $a2_sx macro.tmp matches -1 run return 0

# Compute ratio = (min/max) × 100 → 0..100 mapped to 0..45°
# Swap so we always divide smaller by larger (→ octant 0..45°)
scoreboard players set $a2_swap macro.tmp 0
execute if score $a2_ay macro.tmp > $a2_ax macro.tmp run scoreboard players set $a2_swap macro.tmp 1
execute if score $a2_swap macro.tmp matches 1 run scoreboard players operation $a2_ax macro.tmp >< $a2_ay macro.tmp

# ratio = ay*100 / ax (ay ≤ ax here)
scoreboard players set $a2_100 macro.tmp 100
scoreboard players operation $a2_ay macro.tmp *= $a2_100 macro.tmp
scoreboard players operation $a2_ay macro.tmp /= $a2_ax macro.tmp

# Lookup table: ratio 0-100 → atan(ratio/100) × 1000 in degrees
execute if score $a2_ay macro.tmp matches 0 run scoreboard players set $a2_r macro.tmp 0
execute if score $a2_ay macro.tmp matches 1 run scoreboard players set $a2_r macro.tmp 573
execute if score $a2_ay macro.tmp matches 2 run scoreboard players set $a2_r macro.tmp 1146
execute if score $a2_ay macro.tmp matches 3 run scoreboard players set $a2_r macro.tmp 1718
execute if score $a2_ay macro.tmp matches 4 run scoreboard players set $a2_r macro.tmp 2291
execute if score $a2_ay macro.tmp matches 5 run scoreboard players set $a2_r macro.tmp 2862
execute if score $a2_ay macro.tmp matches 6 run scoreboard players set $a2_r macro.tmp 3433
execute if score $a2_ay macro.tmp matches 7 run scoreboard players set $a2_r macro.tmp 4004
execute if score $a2_ay macro.tmp matches 8 run scoreboard players set $a2_r macro.tmp 4574
execute if score $a2_ay macro.tmp matches 9 run scoreboard players set $a2_r macro.tmp 5143
execute if score $a2_ay macro.tmp matches 10 run scoreboard players set $a2_r macro.tmp 5711
execute if score $a2_ay macro.tmp matches 11 run scoreboard players set $a2_r macro.tmp 6279
execute if score $a2_ay macro.tmp matches 12 run scoreboard players set $a2_r macro.tmp 6843
execute if score $a2_ay macro.tmp matches 13 run scoreboard players set $a2_r macro.tmp 7407
execute if score $a2_ay macro.tmp matches 14 run scoreboard players set $a2_r macro.tmp 7969
execute if score $a2_ay macro.tmp matches 15 run scoreboard players set $a2_r macro.tmp 8531
execute if score $a2_ay macro.tmp matches 16 run scoreboard players set $a2_r macro.tmp 9090
execute if score $a2_ay macro.tmp matches 17 run scoreboard players set $a2_r macro.tmp 9649
execute if score $a2_ay macro.tmp matches 18 run scoreboard players set $a2_r macro.tmp 10205
execute if score $a2_ay macro.tmp matches 19 run scoreboard players set $a2_r macro.tmp 10760
execute if score $a2_ay macro.tmp matches 20 run scoreboard players set $a2_r macro.tmp 11310
execute if score $a2_ay macro.tmp matches 21 run scoreboard players set $a2_r macro.tmp 11860
execute if score $a2_ay macro.tmp matches 22 run scoreboard players set $a2_r macro.tmp 12407
execute if score $a2_ay macro.tmp matches 23 run scoreboard players set $a2_r macro.tmp 12951
execute if score $a2_ay macro.tmp matches 24 run scoreboard players set $a2_r macro.tmp 13495
execute if score $a2_ay macro.tmp matches 25 run scoreboard players set $a2_r macro.tmp 14036
execute if score $a2_ay macro.tmp matches 26 run scoreboard players set $a2_r macro.tmp 14574
execute if score $a2_ay macro.tmp matches 27 run scoreboard players set $a2_r macro.tmp 15111
execute if score $a2_ay macro.tmp matches 28 run scoreboard players set $a2_r macro.tmp 15643
execute if score $a2_ay macro.tmp matches 29 run scoreboard players set $a2_r macro.tmp 16174
execute if score $a2_ay macro.tmp matches 30 run scoreboard players set $a2_r macro.tmp 16699
execute if score $a2_ay macro.tmp matches 31 run scoreboard players set $a2_r macro.tmp 17223
execute if score $a2_ay macro.tmp matches 32 run scoreboard players set $a2_r macro.tmp 17744
execute if score $a2_ay macro.tmp matches 33 run scoreboard players set $a2_r macro.tmp 18263
execute if score $a2_ay macro.tmp matches 34 run scoreboard players set $a2_r macro.tmp 18778
execute if score $a2_ay macro.tmp matches 35 run scoreboard players set $a2_r macro.tmp 19290
execute if score $a2_ay macro.tmp matches 36 run scoreboard players set $a2_r macro.tmp 19799
execute if score $a2_ay macro.tmp matches 37 run scoreboard players set $a2_r macro.tmp 20304
execute if score $a2_ay macro.tmp matches 38 run scoreboard players set $a2_r macro.tmp 20806
execute if score $a2_ay macro.tmp matches 39 run scoreboard players set $a2_r macro.tmp 21304
execute if score $a2_ay macro.tmp matches 40 run scoreboard players set $a2_r macro.tmp 21801
execute if score $a2_ay macro.tmp matches 41 run scoreboard players set $a2_r macro.tmp 22292
execute if score $a2_ay macro.tmp matches 42 run scoreboard players set $a2_r macro.tmp 22782
execute if score $a2_ay macro.tmp matches 43 run scoreboard players set $a2_r macro.tmp 23268
execute if score $a2_ay macro.tmp matches 44 run scoreboard players set $a2_r macro.tmp 23749
execute if score $a2_ay macro.tmp matches 45 run scoreboard players set $a2_r macro.tmp 24228
execute if score $a2_ay macro.tmp matches 46 run scoreboard players set $a2_r macro.tmp 24703
execute if score $a2_ay macro.tmp matches 47 run scoreboard players set $a2_r macro.tmp 25174
execute if score $a2_ay macro.tmp matches 48 run scoreboard players set $a2_r macro.tmp 25642
execute if score $a2_ay macro.tmp matches 49 run scoreboard players set $a2_r macro.tmp 26105
execute if score $a2_ay macro.tmp matches 50 run scoreboard players set $a2_r macro.tmp 26565
execute if score $a2_ay macro.tmp matches 51 run scoreboard players set $a2_r macro.tmp 27021
execute if score $a2_ay macro.tmp matches 52 run scoreboard players set $a2_r macro.tmp 27473
execute if score $a2_ay macro.tmp matches 53 run scoreboard players set $a2_r macro.tmp 27922
execute if score $a2_ay macro.tmp matches 54 run scoreboard players set $a2_r macro.tmp 28367
execute if score $a2_ay macro.tmp matches 55 run scoreboard players set $a2_r macro.tmp 28808
execute if score $a2_ay macro.tmp matches 56 run scoreboard players set $a2_r macro.tmp 29145
execute if score $a2_ay macro.tmp matches 57 run scoreboard players set $a2_r macro.tmp 29678
execute if score $a2_ay macro.tmp matches 58 run scoreboard players set $a2_r macro.tmp 30107
execute if score $a2_ay macro.tmp matches 59 run scoreboard players set $a2_r macro.tmp 30531
execute if score $a2_ay macro.tmp matches 60 run scoreboard players set $a2_r macro.tmp 30964
execute if score $a2_ay macro.tmp matches 61 run scoreboard players set $a2_r macro.tmp 31333
execute if score $a2_ay macro.tmp matches 62 run scoreboard players set $a2_r macro.tmp 31759
execute if score $a2_ay macro.tmp matches 63 run scoreboard players set $a2_r macro.tmp 32175
execute if score $a2_ay macro.tmp matches 64 run scoreboard players set $a2_r macro.tmp 32619
execute if score $a2_ay macro.tmp matches 65 run scoreboard players set $a2_r macro.tmp 33001
execute if score $a2_ay macro.tmp matches 66 run scoreboard players set $a2_r macro.tmp 33401
execute if score $a2_ay macro.tmp matches 67 run scoreboard players set $a2_r macro.tmp 33801
execute if score $a2_ay macro.tmp matches 68 run scoreboard players set $a2_r macro.tmp 34200
execute if score $a2_ay macro.tmp matches 69 run scoreboard players set $a2_r macro.tmp 34596
execute if score $a2_ay macro.tmp matches 70 run scoreboard players set $a2_r macro.tmp 34992
execute if score $a2_ay macro.tmp matches 71 run scoreboard players set $a2_r macro.tmp 35384
execute if score $a2_ay macro.tmp matches 72 run scoreboard players set $a2_r macro.tmp 35757
execute if score $a2_ay macro.tmp matches 73 run scoreboard players set $a2_r macro.tmp 36161
execute if score $a2_ay macro.tmp matches 74 run scoreboard players set $a2_r macro.tmp 36541
execute if score $a2_ay macro.tmp matches 75 run scoreboard players set $a2_r macro.tmp 36920
execute if score $a2_ay macro.tmp matches 76 run scoreboard players set $a2_r macro.tmp 37297
execute if score $a2_ay macro.tmp matches 77 run scoreboard players set $a2_r macro.tmp 37672
execute if score $a2_ay macro.tmp matches 78 run scoreboard players set $a2_r macro.tmp 38045
execute if score $a2_ay macro.tmp matches 79 run scoreboard players set $a2_r macro.tmp 38416
execute if score $a2_ay macro.tmp matches 80 run scoreboard players set $a2_r macro.tmp 38785
execute if score $a2_ay macro.tmp matches 81 run scoreboard players set $a2_r macro.tmp 39151
execute if score $a2_ay macro.tmp matches 82 run scoreboard players set $a2_r macro.tmp 39516
execute if score $a2_ay macro.tmp matches 83 run scoreboard players set $a2_r macro.tmp 39878
execute if score $a2_ay macro.tmp matches 84 run scoreboard players set $a2_r macro.tmp 40236
execute if score $a2_ay macro.tmp matches 85 run scoreboard players set $a2_r macro.tmp 40593
execute if score $a2_ay macro.tmp matches 86 run scoreboard players set $a2_r macro.tmp 40948
execute if score $a2_ay macro.tmp matches 87 run scoreboard players set $a2_r macro.tmp 41301
execute if score $a2_ay macro.tmp matches 88 run scoreboard players set $a2_r macro.tmp 41634
execute if score $a2_ay macro.tmp matches 89 run scoreboard players set $a2_r macro.tmp 41996
execute if score $a2_ay macro.tmp matches 90 run scoreboard players set $a2_r macro.tmp 42274
execute if score $a2_ay macro.tmp matches 91 run scoreboard players set $a2_r macro.tmp 42620
execute if score $a2_ay macro.tmp matches 92 run scoreboard players set $a2_r macro.tmp 42965
execute if score $a2_ay macro.tmp matches 93 run scoreboard players set $a2_r macro.tmp 43307
execute if score $a2_ay macro.tmp matches 94 run scoreboard players set $a2_r macro.tmp 43648
execute if score $a2_ay macro.tmp matches 95 run scoreboard players set $a2_r macro.tmp 43565
execute if score $a2_ay macro.tmp matches 96 run scoreboard players set $a2_r macro.tmp 44321
execute if score $a2_ay macro.tmp matches 97 run scoreboard players set $a2_r macro.tmp 44659
execute if score $a2_ay macro.tmp matches 98 run scoreboard players set $a2_r macro.tmp 44996
execute if score $a2_ay macro.tmp matches 99 run scoreboard players set $a2_r macro.tmp 44731
execute if score $a2_ay macro.tmp matches 100 run scoreboard players set $a2_r macro.tmp 45000

# Undo swap: if swapped, angle = 90000 - angle
execute if score $a2_swap macro.tmp matches 1 run scoreboard players set $a2_90 macro.tmp 90000
execute if score $a2_swap macro.tmp matches 1 run scoreboard players operation $a2_90 macro.tmp -= $a2_r macro.tmp
execute if score $a2_swap macro.tmp matches 1 run scoreboard players operation $a2_r macro.tmp = $a2_90 macro.tmp

# Apply quadrant offsets
# Q2 (x<0, y≥0): angle = 180000 - angle
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches 1 run scoreboard players set $a2_180 macro.tmp 180000
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches 1 run scoreboard players operation $a2_180 macro.tmp -= $a2_r macro.tmp
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches 1 run scoreboard players operation $a2_r macro.tmp = $a2_180 macro.tmp

# Q3 (x<0, y<0): angle = -(180000 - angle) → angle - 180000
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches -1 run scoreboard players set $a2_180 macro.tmp 180000
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches -1 run scoreboard players operation $a2_180 macro.tmp -= $a2_r macro.tmp
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches -1 run scoreboard players set $a2_neg macro.tmp 0
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches -1 run scoreboard players operation $a2_neg macro.tmp -= $a2_180 macro.tmp
execute if score $a2_sx macro.tmp matches -1 if score $a2_sy macro.tmp matches -1 run scoreboard players operation $a2_r macro.tmp = $a2_neg macro.tmp

# Q4 (x≥0, y<0): angle = -angle
execute if score $a2_sx macro.tmp matches 1 if score $a2_sy macro.tmp matches -1 run scoreboard players set $a2_neg macro.tmp 0
execute if score $a2_sx macro.tmp matches 1 if score $a2_sy macro.tmp matches -1 run scoreboard players operation $a2_neg macro.tmp -= $a2_r macro.tmp
execute if score $a2_sx macro.tmp matches 1 if score $a2_sy macro.tmp matches -1 run scoreboard players operation $a2_r macro.tmp = $a2_neg macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $a2_r macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/atan2 ","color":"aqua"},{"text":"y=$(y) x=$(x) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"},{"text":"/1000°","color":"#555555"}]
