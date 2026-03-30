# macro:hook/internal/bind_exec [MACRO]
# INPUT: $(event), $(func) veya $(cmd)

$execute if data storage macro:input {func:"$(func)"} run data modify storage macro:engine hook_binds append value {event:"$(event)",func:"$(func)"}
$execute unless data storage macro:input {func:"$(func)"} run data modify storage macro:engine hook_binds append value {event:"$(event)",cmd:"$(cmd)"}

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"hook/bind ","color":"aqua"},{"text":"$(event)","color":"yellow"},{"text":" → ","color":"#555555"},{"text":"$(func)$(cmd)","color":"white"}]}
