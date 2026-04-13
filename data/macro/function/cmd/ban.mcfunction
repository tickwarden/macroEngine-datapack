# macro:cmd/ban — Dangerous command (confirmation gate required)
#
# SECURITY CHECKS (unchanged from original)
#   - Requires macro.admin tag (via check_all → perm_check)
#   - Requires caller to be a player entity
#   - Requires overworld dimension
#   - Requires creative game mode
#
# CHANGE FROM PREVIOUS BEHAVIOUR
# --------------------------------
# This function NO LONGER bans immediately.
# It stores the ban parameters in macro:engine pending_gate and opens the
# dangerous-command gate. The ban executes only after admin runs:
#   /function ame_load:gate/yes
#
# To cancel:
#   /function ame_load:gate/no
#
# Auto-cancel fires after 30 seconds if no response.
#
# USAGE (unchanged):
#   data modify storage macro:input player set value "PlayerName"
#   data modify storage macro:input reason set value "Reason string"
#   function macro:cmd/ban with storage macro:input {}
#
# MACRO FIELDS:
#   $(player) — target player name
#   $(reason) — ban reason

execute unless function macro:tools/utils/check_all run return 0
execute unless entity @s[type=minecraft:player] run return 0
execute unless dimension minecraft:overworld run return 0
execute unless entity @s[gamemode=creative] run return 0

# Store ban context for gate confirmation
# Every $ line must contain at least one $(key)
$data modify storage macro:engine pending_gate set value {type:"ban",player:"$(player)",reason:"$(reason)"}

# Open the dangerous-command gate
function ame_load:gate/request
