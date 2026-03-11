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

# Integer.MIN_VALUE (-2147483648) edge case — maps to max positive before mod
# (MIN_VALUE % any_positive can produce MIN_VALUE again due to overflow)
execute if score $rnd macro.tmp matches -2147483648 run scoreboard players set $rnd macro.tmp 2147483647

# BUG FIX v2.0.2: abs() step removed.
# Previous code applied abs() before modulo, which collapsed both x and -x to
# the same residue class, creating a distribution bias (values near 0 were
# underrepresented by ~50%). The signed-modulo correction below handles negative
# values correctly without any bias: (rnd % range + range) % range ∈ [0, range).
# The "if ...-1 run += range" line was dead code before this fix; it is now the
# primary negative-value correction path.

# result = signed_mod(rnd, range) + min  →  ∈ [min, max]
scoreboard players operation $rnd macro.tmp %= $rnd_max macro.tmp
# Signed-modulo correction: MC %-operator mirrors Java; result in (-range, 0] for negatives
execute if score $rnd macro.tmp matches ..-1 run scoreboard players operation $rnd macro.tmp += $rnd_max macro.tmp
scoreboard players operation $rnd macro.tmp += $rnd_min macro.tmp

execute store result storage macro:output result int 1 run scoreboard players get $rnd macro.tmp
