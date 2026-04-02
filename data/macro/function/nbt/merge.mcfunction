# ─────────────────────────────────────────────────────────────────
# macro:nbt/merge
# Merges a compound from src_storage:src_path into dst_storage:dst_path.
# Equivalent to: data modify <dst> merge from <src>
# Existing keys in dst are overwritten by src values; missing keys added.
#
# INPUT (storage macro:input):
#   src_storage → source storage namespace (e.g. "macro:engine")
#   src_path    → source compound path
#   dst_storage → destination storage namespace
#   dst_path    → destination compound path
#
# EXAMPLE:
#   data modify storage macro:input src_storage set value "macro:engine"
#   data modify storage macro:input src_path    set value "players.Steve"
#   data modify storage macro:input dst_storage set value "mypack:data"
#   data modify storage macro:input dst_path    set value "backup.Steve"
#   function macro:nbt/merge
# ─────────────────────────────────────────────────────────────────

function macro:nbt/internal/merge_exec with storage macro:input {}
