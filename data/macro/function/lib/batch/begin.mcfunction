# ─────────────────────────────────────────────────────────────────
# macro:lib/batch/begin
# Starts a new batch or clears an existing one.
#
# INPUT (storage macro:input):
#   id          → batch id
#   spread_over → how many ticks to spread over (default: 1)
# ─────────────────────────────────────────────────────────────────

function macro:lib/batch/internal/begin_exec with storage macro:input {}
