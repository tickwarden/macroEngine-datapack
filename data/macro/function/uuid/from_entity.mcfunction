# ============================================================
# macro:uuid/from_entity
# Mevcut entity'nin (@s) UUID'sini hex string'e çevirir
#
# KULLANIM:
#   execute as <entity> run function macro:uuid/from_entity
#
# ÇIKIŞ:
#   macro:input value → "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#
# Çıktı macro:input value'ya yazılır (AME standardı)
# Her çağrıda direkt NBT'den okuma — her zaman güncel
# Negatif byte hatası düzeltilmiştir (bkz. extract_bytes)
# ============================================================

# Entity UUID'sini int[4] olarak çalışma storage'ına kopyala
data modify storage macro:uuid _work set from entity @s UUID

# Dört int'i scoreboard'a yükle (entity'ye skor yazmadan)
execute store result score $uuid.0 macro.tmp run data get storage macro:uuid _work[0]
execute store result score $uuid.1 macro.tmp run data get storage macro:uuid _work[1]
execute store result score $uuid.2 macro.tmp run data get storage macro:uuid _work[2]
execute store result score $uuid.3 macro.tmp run data get storage macro:uuid _work[3]

# 16 byte'a ayır → hex char'lara çevir → UUID string'i birleştir
function macro:uuid/internal/extract_bytes
function macro:uuid/internal/get_hexes with storage macro:uuid _tmp
function macro:uuid/internal/concat with storage macro:uuid _tmp
