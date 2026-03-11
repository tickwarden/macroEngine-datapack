# ============================================
# macro:perm/trigger/internal/exec
# ============================================
# Bind içindeki func veya cmd'yi çalıştırır.
# func varsa → $function $(func)
# cmd varsa → $$(cmd)
# (trigger/internal/call ve call2 ile aynı mantık)
#
# INPUT: storage macro:engine _ptd_current
# = {value:<int>, [func:"..."], [cmd:"..."], perm:"..."}
# Çağrı: AS @s (player)
# ============================================

execute if data storage macro:engine _ptd_current.func run function macro:trigger/internal/call with storage macro:engine _ptd_current
execute if data storage macro:engine _ptd_current.cmd run function macro:trigger/internal/call2 with storage macro:engine _ptd_current
