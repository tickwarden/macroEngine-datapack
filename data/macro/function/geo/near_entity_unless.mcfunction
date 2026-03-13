# ============================================
# macro:geo/near_entity_unless
# ============================================
# Oyuncunun belirtilen mesafe yaricapinda, istenen type ve tag'e sahip
# entity YOKSA komutu run eder.
#
# Kullanim senaryolari:
# - Tum dusmanlari temizledi mi kontrol et
# - Belirli yaricapta hedef kalmadiysa odul ver
# - Koruma entitysi gitti mi
#
# INPUT: macro:input
# player : <string> -- Oyuncu adi
# type : <string> -- Entity type
# tag : <string> -- Entity tag
# distance : <float> -- Maksimum mesafe (blok)
# invoke : <string> -- Kosul saglanirsa run edilecek komut
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input type set value "minecraft:zombie"
# data modify storage macro:input tag set value "arena_mob"
# data modify storage macro:input distance set value 20
# data modify storage macro:input invoke set value "function mymap:wave/next"
# function macro:geo/near_entity_unless with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] at @s unless entity @e[type=$(type),tag=$(tag),distance=..$(distance),limit=1] run $(invoke)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/near_entity_unless ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]
