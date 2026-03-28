# ─────────────────────────────────────────────────────────────────
# macro:wand/give
# Gives the player a carrot_on_a_stick marked as a wand.
# Item otomatik olarak custom_data ile etiketlenir.
#
# INPUT:
#   $(player) → target player
#   $(tag)    → wand tag (written into custom_data)
#   $(name)   → item name (JSON text component, e.g. "Fire Wand")
#
# EXAMPLE:
#   data modify storage macro:input player set value "Steve"
#   data modify storage macro:input tag set value "fire_wand"
#   data modify storage macro:input name set value "Fire Wand"
#   function macro:wand/give with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$give @a[name=$(player),limit=1] minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name={"text":"$(name)"},minecraft:enchantment_glint_override=true]
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]
