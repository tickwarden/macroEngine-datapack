# ─────────────────────────────────────────────────────────────────
# macro:lib/fiber/kill
# Stops a fiber. Pending resumes in the queue will not run.
#
# INPUT (storage macro:input):
#   id → fiber id
# ─────────────────────────────────────────────────────────────────

function macro:lib/fiber/internal/kill_exec with storage macro:input {}
