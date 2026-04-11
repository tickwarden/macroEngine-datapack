# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/internal/cond_check_tag
# Tag check — @s must have the specified tag
# condition.tag: "admin" or {name:"admin", has:1b}
# ─────────────────────────────────────────────────────────────────

# Simple string format
execute unless data storage macro:engine _mcmd_current.condition.tag{} run function macro:cmd/other/multi_cmd/internal/cond_tag_simple

# Object format {name:"...", has:1b/0b}
execute if data storage macro:engine _mcmd_current.condition.tag{} run function macro:cmd/other/multi_cmd/internal/cond_tag_object
