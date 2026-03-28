# ============================================================
# macro:uuid/cache_clear
# Clears all cache (all entries saved with uuid/store)
#
# KULLANIM:
#   function macro:uuid/cache_clear
#
# Warning: This operation is irreversible. All stored UUIDs are deleted.
# Typically used when resetting the world or when a player leaves.
# ============================================================
data modify storage macro:engine uuid_cache set value {}
