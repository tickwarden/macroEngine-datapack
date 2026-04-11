$execute if data storage macro:engine schedules.$(key) run return 0

function macro:lib/schedule_cmd with storage macro:input {}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/debounce_cmd ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]}
