# macro:lib/string/to_number
# Input:  macro:input string — numeric string (e.g. "42" or "3.14")
# Output: macro:output string.result — numeric NBT value
# Dep:    StringLib (CMDred)
data modify storage macro:engine _str_bridge.Input set from storage macro:input string
function macro:lib/string/internal/to_number_dispatch with storage macro:engine _str_bridge
data modify storage macro:output string.result set from storage stringlib:output to_number
data remove storage stringlib:output to_number
data remove storage macro:engine _str_bridge
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/to_number","color":"aqua"}]
