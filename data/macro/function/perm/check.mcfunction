# ============================================
# macro:perm/check
# ============================================
# Guard fonksiyonu: izin yoksa return 0, varsa return 1.
# Tag tabanlı — tick context'te çağrılabilir (storage lookup yok).
# macro.admin tag her izni kapsar.
#
# BUG FIX v2.0.2: Replaced @a[name=$(player),limit=1] with pid-based
# targeting via macro.pid scoreboard.
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>" }
#
# KULLANIM:
# execute unless function macro:perm/check with storage macro:input {} run return 0
# ============================================

# ─── Resolve pid ─────────────────────────────────────────────────────────────
$execute store result score $pc_pid macro.tmp run data get storage macro:engine player_pids.$(player)
execute if score $pc_pid macro.tmp matches 0 run return 0

# ─── Admin check ─────────────────────────────────────────────────────────────
execute as @a if score @s macro.pid = $pc_pid macro.tmp run execute if entity @s[tag=macro.admin] run return 1

# ─── Perm tag check ──────────────────────────────────────────────────────────
$execute as @a if score @s macro.pid = $pc_pid macro.tmp run execute if entity @s[tag=perm.$(perm)] run return 1

# ─── Denied: notify player ───────────────────────────────────────────────────
$execute as @a if score @s macro.pid = $pc_pid macro.tmp run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
return 0
