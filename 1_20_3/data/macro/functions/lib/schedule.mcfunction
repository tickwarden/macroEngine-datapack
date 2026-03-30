$execute if data storage macro:engine schedules.$(key) run data remove storage macro:engine schedules.$(key)

$data modify storage macro:engine schedules.$(key).func set value "$(func)"
$data modify storage macro:engine schedules.$(key).interval set value $(interval)
$data modify storage macro:engine queue append value {func:"$(func)", delay:$(interval)}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/schedule ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]}
