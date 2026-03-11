# for_each_list ic dongu adimi — for_each_list is called by
execute unless data storage macro:engine _felist_input[0] run return 0

# Mevcut elemani guncelle
data modify storage macro:engine _felist_current set from storage macro:engine _felist_input[0]
execute store result storage macro:engine _felist_i int 1 run scoreboard players get $felist_i macro.tmp

# Kullanici functionunu run
function macro:lib/internal/for_each_list_call with storage macro:engine _felist_state

# Advance the list
data remove storage macro:engine _felist_input[0]
scoreboard players add $felist_i macro.tmp 1

# Next element
function macro:lib/internal/for_each_list_step
