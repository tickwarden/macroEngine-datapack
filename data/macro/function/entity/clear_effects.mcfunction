# ─────────────────────────────────────────────────────────────────
# macro:entity/clear_effects
# Clears all active potion effects from entities matching type+tag.
#
# INPUT : $(type) → entity type selector (e.g. "minecraft:player")
#         $(tag)  → entity tag filter
# ─────────────────────────────────────────────────────────────────

$effect clear @e[type=$(type),tag=$(tag)]
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"entity/clear_effects ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(type)[tag=$(tag)]","color":"aqua"}]
