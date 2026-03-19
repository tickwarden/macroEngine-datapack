# ─────────────────────────────────────────────────────────────────
# macro:wand/give
# Oyuncuya wand olarak işaretlenmiş bir carrot_on_a_stick verir.
# Item otomatik olarak custom_data ile etiketlenir.
#
# INPUT:
#   $(player) → hedef oyuncu
#   $(tag)    → wand tag'i (custom_data içine yazılır)
#   $(name)   → item adı (JSON text component, örn: "Fire Wand")
#
# ÖRNEK:
#   data modify storage macro:input player set value "Steve"
#   data modify storage macro:input tag set value "fire_wand"
#   data modify storage macro:input name set value "Fire Wand"
#   function macro:wand/give with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$give @a[name=$(player),limit=1] minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name={"text":"$(name)"},minecraft:enchantment_glint_override=true]
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]
