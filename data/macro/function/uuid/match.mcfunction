# ============================================================
# macro:uuid/match
# Compares @s entity's UUID with macro:input value
# If matched, runs macro:input func function
#
# KULLANIM:
#   data modify storage macro:input value set value "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#   data modify storage macro:input func set value "mynamespace:my_function"
#   execute as <entity> run function macro:uuid/match
#
# INPUT:
#   macro:input value → UUID string to compare (expected)
#   macro:input func  → function to run if matched
#
# NOTE: func is run in the same entity context.
# ============================================================

# Save expected UUID string to temporary field
# (from_entity call overwrites macro:input value)
data modify storage macro:uuid _match_target set from storage macro:input value

# Convert @s UUID to string → macro:input value
function macro:uuid/from_entity

# Compare: if matched, run func
# Is the current UUID (macro:input value) equal to the expected?
function macro:uuid/internal/match_check with storage macro:input
