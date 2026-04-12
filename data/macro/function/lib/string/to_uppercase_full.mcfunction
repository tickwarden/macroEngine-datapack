# macro:lib/string/to_uppercase_full
# Full variant — covers full Unicode lowercase mapping (slower)
# Input:  macro:input string — string to convert
# Output: macro:output string.result — uppercase string
# Dep:    StringLib (CMDred)
data modify storage macro:engine _str_bridge.String set from storage macro:input string
function macro:lib/string/internal/to_upper_full_dispatch with storage macro:engine _str_bridge
data modify storage macro:output string.result set from storage stringlib:output to_uppercase
data remove storage stringlib:output to_uppercase
data remove storage macro:engine _str_bridge
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/to_uppercase_full","color":"aqua"}]
