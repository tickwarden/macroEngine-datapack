# ============================================================
# macro:uuid/recall
# Retrieves UUID string from the cache
#
# KULLANIM:
#   data modify storage macro:input key set value "benim_anahtarim"
#   function macro:uuid/recall
#
# INPUT:
#   macro:input key → key name used with uuid/store
#
# OUTPUT:
#   macro:input value → UUID hex string
#                       (value unchanged if key not found)
# ============================================================
function macro:uuid/internal/recall_read with storage macro:input
