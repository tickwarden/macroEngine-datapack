# ============================================
# macro:perm/revoke
# ============================================
# Playerdan izin alır. Storage + tag her ikisini de temizler.
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>" }
# ============================================

execute unless entity @s[tag=macro.admin] run return run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$data remove storage macro:engine permissions.$(player).$(perm)
$tag @a[name=$(player),limit=1] remove perm.$(perm)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/revoke ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(player)","color":"white"},{"text":" — ","color":"dark_gray"},{"text":"$(perm)","color":"aqua"},{"text":" revoked","color":"dark_gray"}]
