# ============================================
# macro:math/divmod
# ============================================
# Tam bölme ve kalanı TEK seferde döndürür.
# macro:math/mod + manuel bölmenin birleşik versiyonu.
#
# Minecraft scoreboard /= operatörü sıfıra doğru truncate eder (C-style);
# bu fonksiyon remainder'ı her zaman [0, divisor) aralığında döndürür
# (floored / safe mod — macro:math/mod ile tutarlı).
#
# divisor <= 0 ise her iki alan 0 olarak set edilir (güvenli çıkış).
#
# INPUT: macro:input { value:<int>, divisor:<int> }
# OUTPUT: macro:output { quotient:<int>, remainder:<int> }
#
# EXAMPLES:
# divmod( 7, 3) → { quotient: 2, remainder: 1 }
# divmod(-7, 3) → { quotient:-3, remainder: 2 } ← safe mod
# divmod( 9, 3) → { quotient: 3, remainder: 0 }
# divmod( 5, 1) → { quotient: 5, remainder: 0 }
# ============================================

$scoreboard players set $dvm_v macro.tmp $(value)
$scoreboard players set $dvm_d macro.tmp $(divisor)

# divisor <= 0 → güvenli çıkış
execute if score $dvm_d macro.tmp matches ..0 run data modify storage macro:output quotient set value 0
execute if score $dvm_d macro.tmp matches ..0 run data modify storage macro:output remainder set value 0
execute if score $dvm_d macro.tmp matches ..0 run return 0

# quotient = value / divisor (truncated toward zero)
scoreboard players operation $dvm_q macro.tmp = $dvm_v macro.tmp
scoreboard players operation $dvm_q macro.tmp /= $dvm_d macro.tmp
execute store result storage macro:output quotient int 1 run scoreboard players get $dvm_q macro.tmp

# remainder = safe_mod(value, divisor) — [0, divisor) garantili
scoreboard players operation $dvm_v macro.tmp %= $dvm_d macro.tmp
execute if score $dvm_v macro.tmp matches ..-1 run scoreboard players operation $dvm_v macro.tmp += $dvm_d macro.tmp
execute store result storage macro:output remainder int 1 run scoreboard players get $dvm_v macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/divmod ","color":"aqua"},{"text":"($(value)/$(divisor))","color":"gray"},{"text":" → ","color":"dark_gray"},{"text":"q=","color":"gray"},{"storage":"macro:output","nbt":"quotient","color":"green"},{"text":" r=","color":"gray"},{"storage":"macro:output","nbt":"remainder","color":"green"}]
