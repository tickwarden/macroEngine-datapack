# ============================================
# macro:geo/in_region_unless
# ============================================
# Belirtilen oyuncu AABB bölgesinin DISINDAYSA komutu run eder.
#
# Kullanim senaryolari:
# - Oyuncu sinir disi cikinca uyar
# - Bolge disinda ability kullanimi engelle
# - Kamp alaninin disina cikinca spawn reset
#
# INPUT: macro:input
# player : <string> -- Oyuncu adi
# x/y/z : <int> -- Bolgenin min kosesi
# dx/dy/dz : <int> -- Bolge boyutlari
# invoke : <string> -- Kosul saglanirsa run edilecek komut
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input x set value 0
# data modify storage macro:input y set value 60
# data modify storage macro:input z set value 0
# data modify storage macro:input dx set value 50
# data modify storage macro:input dy set value 20
# data modify storage macro:input dz set value 50
# data modify storage macro:input invoke set value "tp @s 25 64 25"
# function macro:geo/in_region_unless with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1] unless entity @s[x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] run $(invoke)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/in_region_unless ","color":"aqua"},{"text":"$(player)","color":"white"}]
