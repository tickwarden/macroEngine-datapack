$data modify storage macro:engine queue append value {cmd:"$(cmd)", delay:$(delay), player:"$(player)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/wait_cmd_as ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(cmd)","color":"aqua"},{"text":" ($(delay)t) as $(player)","color":"#555555"}]
