# ============================================================
# macro:uuid/store
# Caches @s entity's UUID as both string and int array
#
# KULLANIM:
#   data modify storage macro:input key set value "benim_anahtarim"
#   execute as <entity> run function macro:uuid/store
#
# INPUT:
#   macro:input key → storage key name (e.g. "spawn_point_owner")
#
# OUTPUT (macro:engine uuid_cache.<key>):
#   .str → UUID hex string
#   .arr → UUID int array [I; a, b, c, d]
#
# Not available in GU — an advanced AME-specific function.
# ============================================================

# Build UUID string → macro:input value
function macro:uuid/from_entity

# Also save array form (from_entity already filled _work)
data modify storage macro:uuid _store_arr set from storage macro:uuid _work

# Write both to cache (get key name via macro)
function macro:uuid/internal/store_write with storage macro:input
