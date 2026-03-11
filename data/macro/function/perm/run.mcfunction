# ============================================
# macro:perm/run
# ============================================
# İzin kontrolü yaparak komutu belirtilen oyuncu OLARAK ve
# oyuncunun KONUMUNDA çalıştırır.
# macro.admin tag kontrolü de dahildir.
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>", cmd:"<komut>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# data modify storage macro:input cmd set value "setblock ~ ~ ~ stone"
# function macro:perm/run with storage macro:input {}
# ============================================

# İzin kontrolü (tag tabanlı — admin OR perm.X tag)
data modify storage macro:engine _pr_tmp set value {result:0b}
$execute if entity @a[name=$(player),limit=1,tag=macro.admin] run data modify storage macro:engine _pr_tmp.result set value 1b
$execute if entity @a[name=$(player),limit=1,tag=perm.$(perm)] run data modify storage macro:engine _pr_tmp.result set value 1b

# İzin yok → reddet
$execute if data storage macro:engine _pr_tmp{result:0b} run tellraw @a[name=$(player),limit=1] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
execute if data storage macro:engine _pr_tmp{result:0b} run return 0

# İzin var → komutu oyuncu olarak ve konumunda çalıştır
$execute as @a[name=$(player),limit=1] at @s run $(cmd)

data remove storage macro:engine _pr_tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/run ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"dark_gray"},{"text":"$(perm)","color":"green"},{"text":"] → ","color":"dark_gray"},{"text":"$(cmd)","color":"aqua"}]
