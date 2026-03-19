# ─────────────────────────────────────────────────────────────────
# macro:wand/give_lore
# Lore ile birlikte wand'ı mainhand'e yazar (item replace).
#
# INPUT (storage macro:input):
#   player → hedef oyuncu adı
#   tag    → wand tag'i
#   name   → item adı (string)
#   lore   → lore metni, TEK SATIR (string)
#   color  → lore rengi (örn: "red", "gold", "gray")
#
# ÖRNEK:
#   data modify storage macro:input player set value "Steve"
#   data modify storage macro:input tag set value "fire_wand"
#   data modify storage macro:input name set value "Fire Wand"
#   data modify storage macro:input lore set value "Ateş Hasarı: +20"
#   data modify storage macro:input color set value "red"
#   function macro:wand/give_lore
# ─────────────────────────────────────────────────────────────────

function macro:wand/internal/give_lore_exec with storage macro:input {}
