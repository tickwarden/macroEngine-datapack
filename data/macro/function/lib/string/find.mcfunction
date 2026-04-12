# macro:lib/string/find
# Input:  macro:input string  — haystack string
#         macro:input find    — substring to search
#         macro:input n       — instance count (0=all, +n=first n, -n=last n)
# Output: macro:output string.result — list of start indices, or [-1] if not found
# Dep:    StringLib (CMDred)
data modify storage stringlib:input find.String set from storage macro:input string
data modify storage stringlib:input find.Find set from storage macro:input find
data remove storage stringlib:input find.n
data modify storage stringlib:input find.n set from storage macro:input n
function stringlib:util/find
data modify storage macro:output string.result set from storage stringlib:output find
data remove storage stringlib:input find
data remove storage stringlib:output find
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/find","color":"aqua"}]
