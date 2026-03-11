# ============================================
# macro:perm/grant
# ============================================
# Playerya izin verir.
# Storage kalıcı kayıt (offline dahil), entity tag runtime hızlı erişim.
# tag format: perm.<perm_adi> (Java playerdata'ya kaydedilir — kalıcı)
#
# INPUT: macro:input { player:"<n>", perm:"<izin_adi>" }
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input perm set value "builder"
# function macro:perm/grant with storage macro:input {}
# ============================================

# ─── Executor admin check ───────────────────────────────────────────────────
# SECURITY NOTE: This guard only fires when called as a player entity (@s).
# Command blocks, functions called via /function, and direct storage writes
# bypass this check by design — they are considered trusted server-side callers.
# Do NOT call perm/grant from untrusted player-driven contexts without an
# explicit upstream @s[tag=macro.admin] guard in the calling function.
execute if entity @s unless entity @s[tag=macro.admin] run return run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$data modify storage macro:engine permissions.$(player).$(perm) set value 1b
$tag @a[name=$(player),limit=1] add perm.$(perm)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/grant ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(player)","color":"white"},{"text":" ← ","color":"dark_gray"},{"text":"$(perm)","color":"aqua"}]
