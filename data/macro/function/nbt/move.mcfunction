# ─────────────────────────────────────────────────────────────────
# macro:nbt/move
# Moves a path within the same storage (copy + delete).
#
# INPUT (storage macro:input):
#   storage   → storage namespace
#   from_path → kaynak path
#   to_path   → hedef path
# ─────────────────────────────────────────────────────────────────

function macro:nbt/internal/move_exec with storage macro:input {}
