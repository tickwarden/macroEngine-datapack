$scoreboard players set $sign_v macro.tmp $(value)
execute if score $sign_v macro.tmp matches 1.. run data modify storage macro:output result set value 1
execute if score $sign_v macro.tmp matches 0 run data modify storage macro:output result set value 0
execute if score $sign_v macro.tmp matches ..-1 run data modify storage macro:output result set value -1
