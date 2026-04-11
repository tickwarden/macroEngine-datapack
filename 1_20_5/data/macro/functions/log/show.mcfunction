tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Log Buffer ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━━━","color":"#555555"}]}
execute unless data storage macro:engine log_display[0] run tellraw @s {"text":"","extra":[{"text":" ","color":"#555555"},{"text":"(empty)","color":"gray","italic":true}]}
execute unless data storage macro:engine log_display[0] run return 0

function macro:lib/input_push
data modify storage macro:engine _felist_input set from storage macro:engine log_display
data modify storage macro:input func set value "macro:log/internal/print_entry"
function macro:lib/for_each_list with storage macro:input {}
function macro:lib/input_pop
tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]}
