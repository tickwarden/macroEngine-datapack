# ─────────────────────────────────────────────────────────────────
# macro:lib/batch/add
# Adds a job to the batch queue.
#
# INPUT (storage macro:input):
#   id   → batch id
#   func → function to run (opsiyonel)
#   cmd  → command to run (optional, used if no func)
# ─────────────────────────────────────────────────────────────────

function macro:lib/batch/internal/add_exec with storage macro:input {}
