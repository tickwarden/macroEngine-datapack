# ─────────────────────────────────────────────────────────────────
# macro:wand/has
# Does the player hold a specific wand in their main hand?
#
# INPUT:
#   $(player) → player name
#   $(tag)    → kontrol edilecek wand tag
# OUTPUT:
#   macro:output result → 1b (found) / 0b (not found)
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output result set value 0b
$execute as @a[name=$(player),limit=1] if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [$(tag)] → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
