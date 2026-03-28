# ============================================================
# macro:uuid/internal/recall_arr_read  [MACRO FUNCTION]
# Reads UUID int array from the cache
#
# Call: function macro:uuid/internal/recall_arr_read with storage macro:input
# $(key) = key name
# ============================================================
$data modify storage macro:input value set from storage macro:engine uuid_cache.$(key).arr
