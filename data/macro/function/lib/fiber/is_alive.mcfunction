# ─────────────────────────────────────────────────────────────────
# macro:lib/fiber/is_alive
# Checks whether a fiber is active.
#
# INPUT (storage macro:input):
#   id → fiber id
#
# OUTPUT (storage macro:output):
#   result → 1b (active) | 0b (dead or never started)
# ─────────────────────────────────────────────────────────────────

function macro:lib/fiber/internal/is_alive_exec with storage macro:input {}
