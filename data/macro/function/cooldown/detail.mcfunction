# ============================================
# macro:cooldown/detail
# ============================================
# cooldown/check + cooldown/remaining + expiry bilgisini
# TEK çağrıda döndürür.
#
# INPUT: macro:input { player:"<n>", key:"<cooldown>" }
# OUTPUT: macro:output { active:1b/0b, remaining:<int>, expires:<int> }
#
# active — 1b: cooldown hâlâ devam ediyor / 0b: sona erdi (hazır)
# remaining — kalan tick sayısı (0 = hazır veya kayıt yok)
# expires — dolacağı epoch tick değeri (0 = kayıt yok)
#
# EXAMPLES:
# # Cooldown yok / dolmuş:
# → macro:output { active:0b, remaining:0, expires:0 }
#
# # Cooldown aktif (örn. epoch=1300, expiry=1347):
# → macro:output { active:1b, remaining:47, expires:1347 }
#
# NOT: cooldown/check veya cooldown/remaining yerine doğrudan bu
# fonksiyonu kullanarak tek seferde tüm bilgiye erişebilirsin.
# ============================================

# Defaults: hazır, kayıt yok
data merge storage macro:output {active:0b,remaining:0,expires:0}

# Kayıt yoksa hazır — erken çıkış
$execute unless data storage macro:engine cooldowns.$(player).$(key) run return 0

# Expiry epoch'unu oku ve output'a yaz
$execute store result score $cdd_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)
execute store result storage macro:output expires int 1 run scoreboard players get $cdd_exp macro.tmp

# Şu anki epoch
execute store result score $cdd_now macro.tmp run scoreboard players get $epoch macro.time

# now < expiry → hâlâ aktif
execute if score $cdd_now macro.tmp < $cdd_exp macro.tmp run data modify storage macro:output active set value 1b

# remaining = expiry - now (sadece pozitifse yaz; 0 default kalır)
scoreboard players operation $cdd_exp macro.tmp -= $cdd_now macro.tmp
execute if score $cdd_exp macro.tmp matches 1.. run execute store result storage macro:output remaining int 1 run scoreboard players get $cdd_exp macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/detail ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"dark_gray"},{"text":"$(key)","color":"aqua"},{"text":" active=","color":"dark_gray"},{"storage":"macro:output","nbt":"active","color":"green"},{"text":" rem=","color":"dark_gray"},{"storage":"macro:output","nbt":"remaining","color":"green"},{"text":" exp=","color":"dark_gray"},{"storage":"macro:output","nbt":"expires","color":"green"}]
