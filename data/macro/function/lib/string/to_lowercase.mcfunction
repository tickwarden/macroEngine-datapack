# macro:lib/string/to_lowercase
# Fast variant — covers A-Z only (faster)
# Input:  macro:input string — string to convert
# Output: macro:output string.result — lowercase string
# Dep:    StringLib (CMDred)
data modify storage macro:engine _str_bridge.String set from storage macro:input string
function macro:lib/string/internal/to_lower_fast_dispatch with storage macro:engine _str_bridge
data modify storage macro:output string.result set from storage stringlib:output to_lowercase
data remove storage stringlib:output to_lowercase
data remove storage macro:engine _str_bridge
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/to_lowercase","color":"aqua"}]
