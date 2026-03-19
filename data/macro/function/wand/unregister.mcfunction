# ─────────────────────────────────────────────────────────────────
# macro:wand/unregister
# Belirli tag'e ait tüm wand bind'larını kaldırır.
#
# INPUT (storage macro:input):
#   tag → kaldırılacak wand tag'i
#
# ÖRNEK:
#   data modify storage macro:input tag set value "fire_wand"
#   function macro:wand/unregister
# ─────────────────────────────────────────────────────────────────

function macro:wand/internal/unregister_exec with storage macro:input {}
