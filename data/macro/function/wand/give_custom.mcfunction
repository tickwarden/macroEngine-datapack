# ─────────────────────────────────────────────────────────────────
# macro:wand/give_custom
# Özel bir item'ı wand olarak etiketleyerek verir.
# Herhangi bir item türü kullanılabilir (sword, stick, vb.)
# ama sağ-tık yalnızca carrot_on_a_stick ile çalışır.
#
# INPUT:
#   $(player) → hedef oyuncu
#   $(item)   → item ID (örn: "minecraft:carrot_on_a_stick")
#   $(tag)    → wand tag'i
#   $(name)   → item adı (JSON text string)
#   $(count)  → adet (varsayılan 1)
#
# ÖRNEK:
#   data modify storage macro:input player set value "Steve"
#   data modify storage macro:input item set value "minecraft:carrot_on_a_stick"
#   data modify storage macro:input tag set value "ice_wand"
#   data modify storage macro:input name set value "Ice Wand"
#   data modify storage macro:input count set value 1
#   function macro:wand/give_custom with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$give @a[name=$(player),limit=1] $(item)[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name={"text":"$(name)"},minecraft:enchantment_glint_override=true] $(count)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give_custom ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(item)","color":"aqua"},{"text":" [$(tag)]","color":"#555555"}]
