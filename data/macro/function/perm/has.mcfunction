# ============================================
# macro:perm/has
# ============================================
# Playerin izne sahip olup olmadığını kontrol eder.
# macro.admin tag her izni kapsar.
# Online oyuncu: entity tag (hızlı yol)
# Offline oyuncu: storage fallback
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>" }
# OUTPUT: macro:output { result: 1b (var) / 0b (yok) }
# ============================================

data modify storage macro:output result set value 0b

# admin tag her izni kapsar
$execute if entity @a[name=$(player),limit=1,tag=macro.admin] run data modify storage macro:output result set value 1b
# Runtime tag (online oyuncu için hızlı yol)
$execute if entity @a[name=$(player),limit=1,tag=perm.$(perm)] run data modify storage macro:output result set value 1b
# Storage fallback (offline veya tag henüz sync edilmemişse)
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"dark_gray"},{"text":"$(perm)","color":"aqua"},{"text":" → ","color":"dark_gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
