# macro:lib/string/replace
# Input:  macro:input string  — original string
#         macro:input find    — substring to replace
#         macro:input replace — replacement string
#         macro:input n       — instance count (0/unset=all, +n=first n, -n=last n)
# Output: macro:output string.result — resulting string
# Dep:    StringLib (CMDred)
data modify storage stringlib:input replace.String set from storage macro:input string
data modify storage stringlib:input replace.Find set from storage macro:input find
data modify storage stringlib:input replace.Replace set from storage macro:input replace
data remove storage stringlib:input replace.n
data modify storage stringlib:input replace.n set from storage macro:input n
function stringlib:util/replace
data modify storage macro:output string.result set from storage stringlib:output replace
data remove storage stringlib:input replace
data remove storage stringlib:output replace
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/replace","color":"aqua"}]
