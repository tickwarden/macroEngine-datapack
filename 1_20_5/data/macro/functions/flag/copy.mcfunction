# ─────────────────────────────────────────────────────────────────
# macro:flag/copy
# Copies a flag value from one key to another.
# If the source flag is set, the destination is set.
# If the source flag is absent, the destination is removed.
#  Input : $(from) → source flag key
#          $(to)   → destination flag key
# Output: macro:output result → 1b if copied (flag was set), 0b if cleared
#
# Example:
# data modify storage macro:input from set value "feature_a"
# data modify storage macro:input to set value "feature_a_backup"
# function macro:flag/copy with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

# Default: clear destination
data modify storage macro:output result set value 0b

$execute if data storage macro:engine flags.$(from) run data modify storage macro:engine flags.$(to) set value 1b
$execute if data storage macro:engine flags.$(from) run data modify storage macro:output result set value 1b
$execute unless data storage macro:engine flags.$(from) run data remove storage macro:engine flags.$(to)

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"flag/copy ","color":"aqua"},{"text":"$(from) → $(to) ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]}
