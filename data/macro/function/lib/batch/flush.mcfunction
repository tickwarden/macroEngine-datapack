# ─────────────────────────────────────────────────────────────────
# macro:lib/batch/flush
# Splits batch jobs across spread_over ticks and adds them to process_queue.
# Jobs per tick: ceil(items / spread_over).
# Batch record is deleted after flush.
#
# INPUT (storage macro:input):
#   id → batch id
# ─────────────────────────────────────────────────────────────────

function macro:lib/batch/internal/flush_exec with storage macro:input {}
