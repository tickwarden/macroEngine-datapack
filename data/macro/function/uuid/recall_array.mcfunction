# ============================================================
# macro:uuid/recall_array
# Retrieves UUID int array from the cache
#
# KULLANIM:
#   data modify storage macro:input key set value "benim_anahtarim"
#   function macro:uuid/recall_array
#
# INPUT:
#   macro:input key → key name used with uuid/store
#
# OUTPUT:
#   macro:input value → UUID int array [I; a, b, c, d]
#                       (value unchanged if key not found)
#
# Use case: writing UUID to entity NBT (e.g. Owner field)
# ============================================================
function macro:uuid/internal/recall_arr_read with storage macro:input
