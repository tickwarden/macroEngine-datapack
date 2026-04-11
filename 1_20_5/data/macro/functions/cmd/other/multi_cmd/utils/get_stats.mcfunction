# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/utils/get_stats
# Mevcut istatistikleri macro:output'a kopyala
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output stats set from storage macro:engine _mcmd_stats
