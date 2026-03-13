# ============================================
# macro:geo/in_region
# ============================================
# Belirtilen oyuncu, tanimli dikdortgenler prizmasindan (AABB) icerisinde ise
# komutu run eder. x/y/z min kosesi; dx/dy/dz boyutlari tanimlar.
#
# Kullanim senaryolari:
# - Safe zone kontrolu: oyuncu koreografide mi
# - Trigger zone: belirli alana girince event fire
# - Bolge kilidi: bu alanda degilse engelle
#
# INPUT: macro:input
# player : <string> -- Oyuncu adi
# x : <int> -- Bolgenin min X kosesi
# y : <int> -- Bolgenin min Y kosesi
# z : <int> -- Bolgenin min Z kosesi
# dx : <int> -- X ekseni genisligi
# dy : <int> -- Y ekseni yuksekligi
# dz : <int> -- Z ekseni derinligi
# invoke : <string> -- Kosul saglanirsa run edilecek komut
#
# EXAMPLE:
# data modify storage macro:input player set value "Steve"
# data modify storage macro:input x set value -10
# data modify storage macro:input y set value 60
# data modify storage macro:input z set value -10
# data modify storage macro:input dx set value 20
# data modify storage macro:input dy set value 10
# data modify storage macro:input dz set value 20
# data modify storage macro:input invoke set value "say Bolgede!"
# function macro:geo/in_region with storage macro:input {}
# ============================================

$execute as @a[name=$(player),limit=1,x=$(x),y=$(y),z=$(z),dx=$(dx),dy=$(dy),dz=$(dz)] run $(invoke)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/in_region ","color":"aqua"},{"text":"$(player)","color":"white"}]
