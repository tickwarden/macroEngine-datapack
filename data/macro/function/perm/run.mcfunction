# ============================================
# macro:perm/run
# ============================================
# İzin kontrolü yaparak komutu belirtilen oyuncu OLARAK ve
# oyuncunun KONUMUNDA çalıştırır.
# macro.admin tag kontrolü de dahildir.
#
# BUG FIX v2.0.2: Replaced @a[name=$(player),limit=1] with pid-based
# targeting via macro.pid scoreboard. Eliminates the duplicate-name
# edge case on offline-mode servers. Requires player/init to have
# been called at least once for $(player) so that player_pids entry
# and macro.pid score exist.
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>", cmd:"<komut>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# data modify storage macro:input cmd set value "setblock ~ ~ ~ stone"
# function macro:perm/run with storage macro:input {}
# ============================================

# ─── Resolve player name → unique pid ────────────────────────────────────────
$execute store result score $pr_pid macro.tmp run data get storage macro:engine player_pids.$(player)
# pid=0 → player never initialized; bail out silently
execute if score $pr_pid macro.tmp matches 0 run return 0

# ─── Permission check (pid-based — no name= selector) ────────────────────────
data modify storage macro:engine _pr_tmp set value {result:0b}
execute as @a if score @s macro.pid = $pr_pid macro.tmp run execute if entity @s[tag=macro.admin] run data modify storage macro:engine _pr_tmp.result set value 1b
$execute as @a if score @s macro.pid = $pr_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage macro:engine _pr_tmp.result set value 1b

# ─── Permission denied → notify player and abort ─────────────────────────────
$execute if data storage macro:engine _pr_tmp{result:0b} run execute as @a if score @s macro.pid = $pr_pid macro.tmp run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
execute if data storage macro:engine _pr_tmp{result:0b} run return 0

# ─── Permission granted → execute command as and at player ───────────────────
$execute as @a if score @s macro.pid = $pr_pid macro.tmp at @s run $(cmd)

data remove storage macro:engine _pr_tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/run ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"dark_gray"},{"text":"$(perm)","color":"green"},{"text":"] → ","color":"dark_gray"},{"text":"$(cmd)","color":"aqua"}]
