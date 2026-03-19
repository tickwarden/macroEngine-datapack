# ─────────────────────────────────────────────────────────────────
# macro:wand/has
# Oyuncunun ana elinde belirli wand var mı?
#
# INPUT:
#   $(player) → oyuncu adı
#   $(tag)    → kontrol edilecek wand tag'i
# ÇIKIŞ:
#   macro:output result → 1b (var) / 0b (yok)
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output result set value 0b
$execute as @a[name=$(player),limit=1] if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [$(tag)] → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
