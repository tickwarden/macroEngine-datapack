# ============================================================
# macro:uuid/internal/forget_key  [MACRO FUNCTION]
# Deletes the specified key from uuid_cache
#
# Call: function macro:uuid/internal/forget_key with storage macro:input
# $(key) = name of the key to delete
# ============================================================
$data remove storage macro:engine uuid_cache.$(key)
