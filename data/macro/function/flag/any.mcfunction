# ─────────────────────────────────────────────────────────────────
# macro:flag/any
# Checks whether ANY of two flags is set.
# Returns 1b if at least one of key_a or key_b is set, 0b otherwise.
# For three or more flags, chain calls or use flag/get on each.
#
# INPUT : $(key_a) → first flag key
#         $(key_b) → second flag key
# OUTPUT: macro:output result   → 1b if either flag set, 0b if neither
#         macro:output result_a → 1b if key_a set, 0b otherwise
#         macro:output result_b → 1b if key_b set, 0b otherwise
#
# EXAMPLE:
#   function macro:flag/any {key_a:"pvp_enabled",key_b:"war_active"}
#   → macro:output result = 1b  (if either is set)
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output result_a set value 0b
data modify storage macro:output result_b set value 0b
data modify storage macro:output result set value 0b

scoreboard players set $fany_a macro.tmp 0
scoreboard players set $fany_b macro.tmp 0

$execute if data storage macro:engine flags.$(key_a) run scoreboard players set $fany_a macro.tmp 1
$execute if data storage macro:engine flags.$(key_b) run scoreboard players set $fany_b macro.tmp 1

execute if score $fany_a macro.tmp matches 1 run data modify storage macro:output result_a set value 1b
execute if score $fany_b macro.tmp matches 1 run data modify storage macro:output result_b set value 1b

scoreboard players operation $fany_a macro.tmp += $fany_b macro.tmp
execute if score $fany_a macro.tmp matches 1.. run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"flag/any ","color":"aqua"},{"text":"$(key_a)|$(key_b) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
