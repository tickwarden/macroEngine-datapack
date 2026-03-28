# ============================================================
# macro:uuid/from_array
# Converts int array in macro:input value to UUID string
#
# KULLANIM:
#   data modify storage macro:input value set value [I; a, b, c, d]
#   function macro:uuid/from_array
#
# INPUT:
#   macro:input value → [I; int0, int1, int2, int3]
#
# OUTPUT:
#   macro:input value → "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#
# Output is written to macro:input value (AME standard)
# ============================================================

# Read int[4] array directly from macro:input value
execute store result score $uuid.0 macro.tmp run data get storage macro:input value[0]
execute store result score $uuid.1 macro.tmp run data get storage macro:input value[1]
execute store result score $uuid.2 macro.tmp run data get storage macro:input value[2]
execute store result score $uuid.3 macro.tmp run data get storage macro:input value[3]

# Split into 16 bytes → convert to hex chars → concatenate UUID string
function macro:uuid/internal/extract_bytes
function macro:uuid/internal/get_hexes with storage macro:uuid _tmp
function macro:uuid/internal/concat with storage macro:uuid _tmp
