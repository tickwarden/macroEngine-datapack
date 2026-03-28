# ─────────────────────────────────────────────────────────────────
# macro:wand/cooldown_check
# Wand cooldown aktif mi?
#
# INPUT:
#   $(player) → player name
#   $(tag)    → wand tag
# OUTPUT:
#   macro:output result → 0b=ready, 1b=cooldown active
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output result set value 0b

$execute unless data storage macro:engine cooldowns.$(player).wand_$(tag) run return 0

$execute store result score $wcc_exp macro.tmp run data get storage macro:engine cooldowns.$(player).wand_$(tag)
execute store result score $wcc_now macro.tmp run scoreboard players get $epoch macro.time

execute if score $wcc_now macro.tmp < $wcc_exp macro.tmp run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/cooldown_check ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [$(tag)] → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
