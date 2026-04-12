# macro:lib/string/split
# Input:  macro:input string      — original string
#         macro:input separator   — split delimiter (default " ", ""=each char)
#         macro:input n           — max splits (0/unset=all, +n=first n, -n=last n)
#         macro:input keep_empty  — 1b to keep empty segments, omit/0b to strip
# Output: macro:output string.result — list of string segments
# Dep:    StringLib (CMDred)
data modify storage stringlib:input split.String set from storage macro:input string
data remove storage stringlib:input split.Separator
data modify storage stringlib:input split.Separator set from storage macro:input separator
data remove storage stringlib:input split.n
data modify storage stringlib:input split.n set from storage macro:input n
data remove storage stringlib:input split.KeepEmpty
data modify storage stringlib:input split.KeepEmpty set from storage macro:input keep_empty
function stringlib:util/split
data modify storage macro:output string.result set from storage stringlib:output split
data remove storage stringlib:input split
data remove storage stringlib:output split
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/string/split","color":"aqua"}]
