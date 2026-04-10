# macro:hook/internal/bind_exec [MACRO]
# INPUT: $(event) — required
# macro:input.func OR macro:input.cmd — one must exist
#
# Two-step: append a base compound with just event, then set func or cmd from storage.
# This avoids requiring both $(func) and $(cmd) to be present simultaneously.

$data modify storage macro:engine hook_binds append value {event:"$(event)"}
execute if data storage macro:input func run data modify storage macro:engine hook_binds[-1].func set from storage macro:input func
execute unless data storage macro:input func run data modify storage macro:engine hook_binds[-1].cmd set from storage macro:input cmd

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"hook/bind ","color":"aqua"},{"text":"$(event)","color":"yellow"},{"text":" → ","color":"#555555"},{"text":"$(event)","color":"white"}]
