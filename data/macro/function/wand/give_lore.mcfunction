# ─────────────────────────────────────────────────────────────────
# macro:wand/give_lore
# Writes the wand with lore to mainhand (item replace).
#
# INPUT (storage macro:input):
#   player → target player name
#   tag    → wand tag
#   name   → item name (string)
#   lore   → lore metni, TEK SATIR (string)
#   color  → lore color (e.g. "red", "gold", "gray")
#
# EXAMPLE:
#   data modify storage macro:input player set value "Steve"
#   data modify storage macro:input tag set value "fire_wand"
#   data modify storage macro:input name set value "Fire Wand"
#   data modify storage macro:input lore set value "Fire Damage: +20"
#   data modify storage macro:input color set value "red"
#   function macro:wand/give_lore
# ─────────────────────────────────────────────────────────────────

function macro:wand/internal/give_lore_exec with storage macro:input {}
