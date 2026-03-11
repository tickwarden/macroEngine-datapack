# ============================================
# macro:math/random
# ============================================
# [min, max] araliginda pseudo-random integer uretir.
# Numerical Recipes LCG algorithm (32-bit, overflow wrap).
# Multiple calls within the same tick produce different results
# because _rng_state is updated on every call.
#
# BUG FIX v3.2: epoch=0 durumunda (ilk tick) tohum cok
# zayifti. Sabit bir offset (0xDEAD = 57005) addndi.
# Ayrica tick*31 via ekstra entropi karistiriliyor.
#
# INPUT: macro:input { min:<int>, max:<int> }
# OUTPUT: macro:output { result:<int> }
#
# EXAMPLE:
# data modify storage macro:input min set value 1
# data modify storage macro:input max set value 6
# function macro:math/random with storage macro:input {}
# # → 1-6 arasi zar sonucu
# ============================================

$scoreboard players set $rnd_min macro.tmp $(min)
$scoreboard players set $rnd_max macro.tmp $(max)

# range = max - min + 1
scoreboard players operation $rnd_max macro.tmp -= $rnd_min macro.tmp
scoreboard players add $rnd_max macro.tmp 1

# Seed: use previous state if present, otherwise init from epoch + offset
# BUG FIX v3.2: constant 57005 (0xDEAD) eliminates weak seed when epoch=0
execute if data storage macro:engine _rng_state run execute store result score $rnd macro.tmp run data get storage macro:engine _rng_state
execute unless data storage macro:engine _rng_state run execute store result score $rnd macro.tmp run scoreboard players get $epoch macro.time
execute unless data storage macro:engine _rng_state run scoreboard players add $rnd macro.tmp 57005

# Tick via entropi: tick*31 addnir — ayni tick forde birden fazla cagrida farklilasir
scoreboard players set $rnd_tick macro.tmp 31
execute store result score $rnd_t macro.tmp run scoreboard players get $tick macro.tmp
scoreboard players operation $rnd_t macro.tmp *= $rnd_tick macro.tmp
scoreboard players operation $rnd macro.tmp += $rnd_t macro.tmp

# LCG adimi: next = 1664525 * state + 1013904223 (Numerical Recipes)
scoreboard players set $rnd_a macro.tmp 1664525
scoreboard players operation $rnd macro.tmp *= $rnd_a macro.tmp
scoreboard players add $rnd macro.tmp 1013904223

# State'i save
execute store result storage macro:engine _rng_state int 1 run scoreboard players get $rnd macro.tmp

# Integer.MIN_VALUE (-2147483648) edge case — prevent divide-by-zero
execute if score $rnd macro.tmp matches -2147483648 run scoreboard players set $rnd macro.tmp 2147483647
execute if score $rnd macro.tmp matches ..-1 run scoreboard players set $rnd_neg macro.tmp -1
execute if score $rnd macro.tmp matches ..-1 run scoreboard players operation $rnd macro.tmp *= $rnd_neg macro.tmp

# result = (rnd % range) + min
scoreboard players operation $rnd macro.tmp %= $rnd_max macro.tmp
execute if score $rnd macro.tmp matches ..-1 run scoreboard players operation $rnd macro.tmp += $rnd_max macro.tmp
scoreboard players operation $rnd macro.tmp += $rnd_min macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $rnd macro.tmp
