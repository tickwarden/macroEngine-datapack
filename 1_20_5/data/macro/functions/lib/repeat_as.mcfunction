$data modify storage macro:engine queue append value {func:"$(func)", delay:$(interval), player:"$(player)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/repeat_as ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"},{"text":" as $(player)","color":"#555555"}]
