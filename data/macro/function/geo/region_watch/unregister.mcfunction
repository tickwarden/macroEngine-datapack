# ─────────────────────────────────────────────────────────────────
# macro:geo/region_watch/unregister
# Deletes a registered region. Player state scores are not cleared
# (automatically skipped in the next tick_scan loop).
#
# INPUT (storage macro:input):
#   id → region id
# ─────────────────────────────────────────────────────────────────

function macro:geo/region_watch/internal/unregister_exec with storage macro:input {}
