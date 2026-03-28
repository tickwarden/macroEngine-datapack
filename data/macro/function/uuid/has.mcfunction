# ============================================================
# macro:uuid/has
# Checks whether the specified key exists in the cache
#
# KULLANIM:
#   data modify storage macro:input key set value "benim_anahtarim"
#   execute if score $result macro.tmp matches 1 ...
#   function macro:uuid/has
#
# INPUT:
#   macro:input key → name of the key to check
#
# OUTPUT:
#   $uuid.has macro.tmp → 1 (var) veya 0 (yok)
# ============================================================
scoreboard players set $uuid.has macro.tmp 0
function macro:uuid/internal/has_check with storage macro:input
