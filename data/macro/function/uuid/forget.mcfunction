# ============================================================
# macro:uuid/forget
# Deletes a UUID entry from the cache
#
# KULLANIM:
#   data modify storage macro:input key set value "benim_anahtarim"
#   function macro:uuid/forget
#
# INPUT:
#   macro:input key → name of the key to delete
# ============================================================
function macro:uuid/internal/forget_key with storage macro:input
