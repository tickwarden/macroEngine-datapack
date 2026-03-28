# ─────────────────────────────────────────────────────────────────
# macro:wand/unregister
# Removes all wand binds belonging to a specific tag.
#
# INPUT (storage macro:input):
#   tag → wand tag to remove
#
# EXAMPLE:
#   data modify storage macro:input tag set value "fire_wand"
#   function macro:wand/unregister
# ─────────────────────────────────────────────────────────────────

function macro:wand/internal/unregister_exec with storage macro:input {}
