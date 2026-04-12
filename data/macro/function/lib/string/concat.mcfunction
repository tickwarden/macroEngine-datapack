# macro:lib/string/concat
# Input:  macro:input list   — list of strings to concatenate
# Output: macro:output string.result — combined string
# Dep:    StringLib (CMDred)
data modify storage stringlib:input concat set from storage macro:input list
function stringlib:util/concat
data modify storage macro:output string.result set from storage stringlib:output concat
data remove storage stringlib:input concat
data remove storage stringlib:output concat
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/concat","color":"aqua"}]
