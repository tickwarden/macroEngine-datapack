# ============================================
# macro:perm/list
# ============================================
# Playerin izinlerini macro.debug tag'li oyunculara gösterir.
#
# INPUT: macro:input { player:"<n>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# function macro:perm/list with storage macro:input {}
# ============================================

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Perms: ","color":"aqua"},{"text":"$(player)","color":"white","bold":true},{"text":" ━━━━━━━━━━━━━━","color":"dark_gray"}]
$execute if data storage macro:engine permissions.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"storage":"macro:engine","nbt":"permissions.$(player)","interpret":false,"color":"yellow"}]
$execute unless data storage macro:engine permissions.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"dark_gray"},{"text":"(izin yok)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
