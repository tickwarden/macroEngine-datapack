# ============================================================
# macro:uuid/internal/recall_read  [MACRO FUNCTION]
# Reads UUID string from the cache
#
# Call: function macro:uuid/internal/recall_read with storage macro:input
# $(key) = key name
# ============================================================
$data modify storage macro:input value set from storage macro:engine uuid_cache.$(key).str
