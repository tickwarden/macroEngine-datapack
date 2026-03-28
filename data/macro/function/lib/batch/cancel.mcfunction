# ─────────────────────────────────────────────────────────────────
# macro:lib/batch/cancel
# Cancels a batch that has not been flushed.
# Items already flushed and queued cannot be cancelled
# (pulling from process_queue is not supported — AME design constraint).
#
# INPUT (storage macro:input):
#   id → batch id
# ─────────────────────────────────────────────────────────────────

function macro:lib/batch/internal/cancel_exec with storage macro:input {}
