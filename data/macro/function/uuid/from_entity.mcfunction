# ============================================================
# macro:uuid/from_entity
# Converts the current entity's (@s) UUID to a hex string
#
# KULLANIM:
#   execute as <entity> run function macro:uuid/from_entity
#
# OUTPUT:
#   macro:input value → "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#
# Output is written to macro:input value (AME standard)
# Direct NBT read on each call — always up to date
# Negative byte error is fixed (see extract_bytes)
# ============================================================

# Copy entity UUID as int[4] to working storage
data modify storage macro:uuid _work set from entity @s UUID

# Load four ints to scoreboard (without writing scores to entity)
execute store result score $uuid.0 macro.tmp run data get storage macro:uuid _work[0]
execute store result score $uuid.1 macro.tmp run data get storage macro:uuid _work[1]
execute store result score $uuid.2 macro.tmp run data get storage macro:uuid _work[2]
execute store result score $uuid.3 macro.tmp run data get storage macro:uuid _work[3]

# Split into 16 bytes → convert to hex chars → concatenate UUID string
function macro:uuid/internal/extract_bytes
function macro:uuid/internal/get_hexes with storage macro:uuid _tmp
function macro:uuid/internal/concat with storage macro:uuid _tmp
