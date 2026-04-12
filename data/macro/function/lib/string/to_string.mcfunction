# macro:lib/string/to_string
# Input:  macro:input value — numeric or any SNBT value to stringify
# Output: macro:output string.result — string representation
# Note:   Prefer 'data modify ... set string storage ...' when possible (cheaper)
# Dep:    StringLib (CMDred)
data modify storage macro:engine _str_bridge.Input set from storage macro:input value
function macro:lib/string/internal/to_string_dispatch with storage macro:engine _str_bridge
data modify storage macro:output string.result set from storage stringlib:output to_string
data remove storage stringlib:output to_string
data remove storage macro:engine _str_bridge
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/to_string","color":"aqua"}]
