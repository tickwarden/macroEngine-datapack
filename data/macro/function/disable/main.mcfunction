# macro:disable — Dangerous command (confirmation gate required)
#
# Shuts down macroEngine: removes all AME scoreboards, wipes macro:engine
# and macro:input storage, kills all AME marker entities.
#
# CHANGE FROM PREVIOUS BEHAVIOUR
# --------------------------------
# This function NO LONGER runs cleanup immediately.
# It stores the disable intent in macro:engine pending_gate and opens the
# dangerous-command gate. Cleanup runs only after admin confirms:
#   /function ame_load:gate/yes
#
# To cancel:
#   /function ame_load:gate/no
#
# Auto-cancel fires after 30 seconds if no response.
#
# REQUIRES: macro.admin tag on calling entity
# (check_all → perm_check verifies this before any caller reaches here)

data modify storage macro:engine pending_gate set value {type:"disable"}
function ame_load:gate/request
