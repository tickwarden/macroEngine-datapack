# ============================================
# macro:perm/trigger/enable
# ============================================
# İzin kontrolü yaparak isimli trigger'i oyuncu için aktif eder.
# İzin yoksa oyuncuya hata mesajı gönderir.
# macro.admin tag kontrolü de yapılır.
#
# INPUT: macro:input { player:"<n>", name:"<trigger_adi>", perm:"<izin>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input name set value "test"
# data modify storage macro:input perm set value "player"
# function macro:perm/trigger/enable with storage macro:input {}
# ============================================

data modify storage macro:engine _pte_tmp set value {result:0b}
$execute if entity @a[name=$(player),limit=1,tag=macro.admin] run data modify storage macro:engine _pte_tmp.result set value 1b
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:engine _pte_tmp.result set value 1b

$execute if data storage macro:engine _pte_tmp{result:0b} run tellraw @a[name=$(player),limit=1] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
execute if data storage macro:engine _pte_tmp{result:0b} run return 0

$scoreboard players enable $(player) $(name)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/trigger/enable ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(player)","color":"white"},{"text":" — ","color":"dark_gray"},{"text":"$(name)","color":"aqua"},{"text":" enabled","color":"dark_gray"}]
data remove storage macro:engine _pte_tmp
