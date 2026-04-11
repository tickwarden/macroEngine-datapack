$execute if data storage macro:engine schedules.$(key) run return 0

function macro:lib/schedule with storage macro:input {}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/debounce ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]}
