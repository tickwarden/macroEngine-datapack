# ============================================
# macro:perm/exec
# ============================================
# İzin kontrolü yaparak komutu belirtilen oyuncu
# OLARAK ve oyuncunun KONUMUNDA çalıştırır.
# İzin yoksa oyuncuya hata mesajı gönderir.
#
# INPUT: macro:input { player:"<n>", perm:"<izin>", cmd:"<komut>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# data modify storage macro:input cmd set value "give @s diamond 1"
# function macro:perm/exec with storage macro:input {}
# ============================================

# macro.admin tag her izni kapsar
# İzin yoksa reddet
data modify storage macro:engine _pex_tmp set value {result:0b}
$execute if entity @a[name=$(player),limit=1,tag=macro.admin] run data modify storage macro:engine _pex_tmp.result set value 1b
$execute if data storage macro:engine permissions.$(player).$(perm) run data modify storage macro:engine _pex_tmp.result set value 1b

$execute if data storage macro:engine _pex_tmp{result:0b} run tellraw @a[name=$(player),limit=1] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
execute if data storage macro:engine _pex_tmp{result:0b} run return 0

$execute as @a[name=$(player),limit=1] at @s run $(cmd)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/exec ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"dark_gray"},{"text":"$(perm)","color":"aqua"},{"text":"] → ","color":"dark_gray"},{"text":"$(cmd)","color":"green"}]
data remove storage macro:engine _pex_tmp
