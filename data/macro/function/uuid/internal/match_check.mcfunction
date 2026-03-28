# ============================================================
# macro:uuid/internal/match_check  [MACRO FUNCTION]
# Dynamically compares the current UUID string with _match_target
#
# Call: function macro:uuid/internal/match_check with storage macro:input
# $(value) = current UUID string written by from_entity
# ============================================================
$execute if data storage macro:uuid {_match_target:"$(value)"} run function macro:uuid/internal/match_fire with storage macro:input
