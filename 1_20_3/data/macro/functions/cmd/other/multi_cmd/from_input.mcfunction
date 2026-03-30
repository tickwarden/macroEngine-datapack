data modify storage macro:engine _mcmd_list set from storage macro:input list
function macro:cmd/other/multi_cmd/run
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/other/multi_cmd/from_input ","color":"aqua"},{"text":"▶ list → run","color":"#555555"}]}
