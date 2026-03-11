# ============================================
# macro:cmd/other/multi_cmd/run_func
# ============================================
# _mcmd_list içindeki fonksiyonları (namespace:path)
# sırayla çalıştırır.
#
# KULLANIM:
# data modify storage macro:engine _mcmd_list set value ["mypack:phase1", "mypack:phase2", "mypack:phase3"]
# function macro:cmd/other/multi_cmd/run_func
#
# NOT: Komut string'leri değil, fonksiyon path'leri beklenir.
# Komutlar için: macro:cmd/other/multi_cmd/run
# ============================================

function macro:cmd/other/multi_cmd/internal/step_func
data remove storage macro:engine _mcmd_list
data remove storage macro:engine _mcmd_entry
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run_func ","color":"aqua"},{"text":"✔ func batch done","color":"green"}]
