# macro:lib/fiber/internal/is_alive_exec [MACRO]
# INPUT: $(id)

data modify storage macro:output result set value 0b
$execute if data storage macro:engine fibers.$(id){alive:1b} run data modify storage macro:output result set value 1b

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/fiber/is_alive ","color":"aqua"},{"text":"$(id)","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
