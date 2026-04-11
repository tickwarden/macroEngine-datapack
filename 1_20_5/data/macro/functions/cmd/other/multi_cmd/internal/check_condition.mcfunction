# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/check_condition
# Check condition and write result to $mcmd_cond_result
# _mcmd_current.condition: {tag:"...", score:{...}, predicate:"..."}
# ─────────────────────────────────────────────────────────────────

# Default: condition passed
scoreboard players set $mcmd_cond_result macro.tmp 1

# Tag check
execute if data storage macro:engine _mcmd_current.condition.tag run function macro:cmd/other/multi_cmd/internal/cond_check_tag

# Score check
execute if data storage macro:engine _mcmd_current.condition.score run function macro:cmd/other/multi_cmd/internal/cond_check_score

# Predicate check
execute if data storage macro:engine _mcmd_current.condition.predicate run function macro:cmd/other/multi_cmd/internal/cond_check_predicate

# Entity check (selector)
execute if data storage macro:engine _mcmd_current.condition.entity run function macro:cmd/other/multi_cmd/internal/cond_check_entity

# Storage check
execute if data storage macro:engine _mcmd_current.condition.storage run function macro:cmd/other/multi_cmd/internal/cond_check_storage
