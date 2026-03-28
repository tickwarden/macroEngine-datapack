# ─────────────────────────────────────────────────────────────────
# macro:lib/fiber/resume
# Resumes a fiber immediately (no delay).
# Used to trigger a fiber step externally without yield.
#
# INPUT (storage macro:input):
#   id   → fiber id
#   func → function to run
# ─────────────────────────────────────────────────────────────────

function macro:lib/fiber/internal/resume_exec with storage macro:input {}
