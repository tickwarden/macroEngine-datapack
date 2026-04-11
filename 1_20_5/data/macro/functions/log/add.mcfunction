execute unless data storage macro:engine log_display run data modify storage macro:engine log_display set value []

$data modify storage macro:engine log_display append value {text:"[$(level)] $(message)",color:"$(color)"}

scoreboard players add #ame.log_count macro.tmp 1
execute if score #ame.log_count macro.tmp matches 31.. run data remove storage macro:engine log_display[0]
execute if score #ame.log_count macro.tmp matches 31.. run scoreboard players remove #ame.log_count macro.tmp 1
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"log/add ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(level)","color":"aqua"}]}
