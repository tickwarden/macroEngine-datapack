# ============================================================
# macro:uuid/internal/has_check  [MACRO FUNCTION]
# Checks key existence in the cache
#
# Call: function macro:uuid/internal/has_check with storage macro:input
# $(key) = name of the key to check
# ============================================================
$execute if data storage macro:engine uuid_cache.$(key) run scoreboard players set $uuid.has macro.tmp 1
