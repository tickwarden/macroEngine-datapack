# macro:lib/string/insert
# Input:  macro:input string    — original string
#         macro:input insertion — string to insert
#         macro:input index     — insertion position (integer)
# Output: macro:output string.result — resulting string
# Dep:    StringLib (CMDred)
data modify storage stringlib:input insert.String set from storage macro:input string
data modify storage stringlib:input insert.Insertion set from storage macro:input insertion
data modify storage macro:engine _str_bridge.Index set from storage macro:input index
function macro:lib/string/internal/insert_dispatch with storage macro:engine _str_bridge
data modify storage macro:output string.result set from storage stringlib:output insert
data remove storage stringlib:input insert
data remove storage stringlib:output insert
data remove storage macro:engine _str_bridge
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/insert","color":"aqua"}]
