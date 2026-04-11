# Convert string list to {func:"..."} objects
execute unless data storage macro:input list[0] run return 0

data modify storage macro:engine _mcmd_func_tmp set value {}
data modify storage macro:engine _mcmd_func_tmp.func set from storage macro:input list[0]
data modify storage macro:engine _mcmd_queue append from storage macro:engine _mcmd_func_tmp

data remove storage macro:input list[0]
function macro:cmd/other/multi_cmd/internal/func_convert_loop
