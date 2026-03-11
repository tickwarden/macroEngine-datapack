# ============================================
# macro:cmd/other/multi_cmd/run
# ============================================
# _mcmd_list içindeki komutları sırayla çalıştırır.
# Mevcut executor (@s) olarak ve konumunda çalışır.
#
# KULLANIM:
# data modify storage macro:engine _mcmd_list set value ["say Merhaba", "give @s diamond 1", "effect give @s speed 10 2 true"]
# function macro:cmd/other/multi_cmd/run
#
# NOT: macro:input.list üzerinden kullanmak için
# macro:cmd/other/multi_cmd/from_input tercih edin.
# ============================================

function macro:cmd/other/multi_cmd/internal/step
data remove storage macro:engine _mcmd_list
data remove storage macro:engine _mcmd_entry
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/run ","color":"aqua"},{"text":"✔ batch done","color":"green"}]
