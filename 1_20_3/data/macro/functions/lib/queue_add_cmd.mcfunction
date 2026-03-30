$data modify storage macro:engine queue append value {cmd:"$(cmd)", delay:$(delay)}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/queue_add_cmd ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(cmd)","color":"aqua"}]}
