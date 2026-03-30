scoreboard players set $team_cnt macro.tmp 0
$execute as @a[team=$(team)] run scoreboard players add $team_cnt macro.tmp 1
execute store result storage macro:output result int 1 run scoreboard players get $team_cnt macro.tmp
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"team/count ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(team)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
