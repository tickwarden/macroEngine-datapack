# ============================================
# macro:geo/near_entity
# ============================================
# Oyuncunun belirtilen mesafe yaricapinda, istenen type ve tag'e sahip
# entity VARSA komutu run eder.
#
# Kullanim senaryolari:
# - NPC yeterince yakinsa diyalog ac
# - Boss arenasindaki entity active edilsin mi
# - Proximity mine: yakina gelen olursa patlat
#
# INPUT: macro:input
# player : <string> -- Oyuncu adi
# type : <string> -- Entity type (minecraft:zombie vb.)
# tag : <string> -- Entity tag
# distance : <float> -- Maksimum mesafe (blok)
# invoke : <string> -- Kosul saglanirsa run edilecek komut
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input type set value "minecraft:villager"
# data modify storage macro:input tag set value "quest_npc"
# data modify storage macro:input distance set value 3
# data modify storage macro:input invoke set value "function mymap:dialog/start"
# function macro:geo/near_entity with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] at @s if entity @e[type=$(type),tag=$(tag),distance=..$(distance),limit=1] run $(invoke)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/near_entity ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]
