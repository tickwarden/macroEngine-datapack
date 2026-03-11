# ============================================
# macro:lib/ticks_to_time
# ============================================
# Tick sayısını saat / dakika / saniye / tick bileşenlerine ayırır.
# Negatif girişler sıfır olarak işlenir.
#
# INPUT: macro:input { ticks:<int> }
# OUTPUT: macro:output { hours:<int>, minutes:<int>, seconds:<int>, ticks:<int> }
#
# ticks — 20'de kalan tick fraksiyonu [0, 19]
# seconds — 60'da kalan saniyeler [0, 59]
# minutes — 60'da kalan dakikalar [0, 59]
# hours — toplam saat [0, ∞)
#
# EXAMPLES:
# ticks_to_time(0) → { hours:0, minutes:0, seconds:0, ticks:0 }
# ticks_to_time(20) → { hours:0, minutes:0, seconds:1, ticks:0 }
# ticks_to_time(4200) → { hours:0, minutes:3, seconds:30, ticks:0 }
# ticks_to_time(4215) → { hours:0, minutes:3, seconds:30, ticks:15 }
# ticks_to_time(72000)→ { hours:1, minutes:0, seconds:0, ticks:0 }
# ============================================

$scoreboard players set $ttt_t macro.tmp $(ticks)

# Negatif → sıfırla
execute if score $ttt_t macro.tmp matches ..-1 run scoreboard players set $ttt_t macro.tmp 0

# ── ticks bileşeni: total_ticks % 20 ─────────────────────────
scoreboard players operation $ttt_r macro.tmp = $ttt_t macro.tmp
scoreboard players set $ttt_20 macro.tmp 20
scoreboard players operation $ttt_r macro.tmp %= $ttt_20 macro.tmp
execute store result storage macro:output ticks int 1 run scoreboard players get $ttt_r macro.tmp

# total_seconds = total_ticks / 20
scoreboard players operation $ttt_t macro.tmp /= $ttt_20 macro.tmp

# ── seconds bileşeni: total_seconds % 60 ─────────────────────
scoreboard players operation $ttt_r macro.tmp = $ttt_t macro.tmp
scoreboard players set $ttt_60 macro.tmp 60
scoreboard players operation $ttt_r macro.tmp %= $ttt_60 macro.tmp
execute store result storage macro:output seconds int 1 run scoreboard players get $ttt_r macro.tmp

# total_minutes = total_seconds / 60
scoreboard players operation $ttt_t macro.tmp /= $ttt_60 macro.tmp

# ── minutes bileşeni: total_minutes % 60 ─────────────────────
scoreboard players operation $ttt_r macro.tmp = $ttt_t macro.tmp
scoreboard players operation $ttt_r macro.tmp %= $ttt_60 macro.tmp
execute store result storage macro:output minutes int 1 run scoreboard players get $ttt_r macro.tmp

# ── hours bileşeni: total_minutes / 60 ───────────────────────
scoreboard players operation $ttt_t macro.tmp /= $ttt_60 macro.tmp
execute store result storage macro:output hours int 1 run scoreboard players get $ttt_t macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/ticks_to_time ","color":"aqua"},{"text":"($(ticks)t)","color":"gray"},{"text":" → ","color":"dark_gray"},{"storage":"macro:output","nbt":"hours","color":"green"},{"text":"h ","color":"gray"},{"storage":"macro:output","nbt":"minutes","color":"green"},{"text":"m ","color":"gray"},{"storage":"macro:output","nbt":"seconds","color":"green"},{"text":"s ","color":"gray"},{"storage":"macro:output","nbt":"ticks","color":"green"},{"text":"t","color":"gray"}]
