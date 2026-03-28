# ============================================================
# macro:uuid/internal/store_write  [MACRO FUNCTION]
# UUID'yi macro:engine uuid_cache'e yazar (hem string hem array)
#
# Call: function macro:uuid/internal/store_write with storage macro:input
# $(key)   = key name
# $(value) = UUID hex string (written by from_entity)
# ============================================================
$data modify storage macro:engine uuid_cache.$(key).str set value "$(value)"
$data modify storage macro:engine uuid_cache.$(key).arr set from storage macro:uuid _store_arr
