# ============================================
# macro:perm/check
# ============================================
# Guard fonksiyonu: izin yoksa return 0, varsa return 1.
# Tag tabanlı — tick context'te çağrılabilir (storage lookup yok).
# macro.admin tag her izni kapsar.
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>" }
#
# KULLANIM:
# execute unless function macro:perm/check with storage macro:input {} run return 0
# ============================================

$execute if entity @a[name=$(player),limit=1,tag=macro.admin] run return 1
$execute if entity @a[name=$(player),limit=1,tag=perm.$(perm)] run return 1

# Yok → oyuncuya bildir ve 0 dön
$tellraw @a[name=$(player),limit=1] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
return 0
