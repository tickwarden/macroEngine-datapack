execute store result score $next_pid macro.tmp run data get storage macro:engine _pid_seq

scoreboard players add $next_pid macro.tmp 1

$execute store result storage macro:engine player_pids.$(player) int 1 run scoreboard players get $next_pid macro.tmp
$scoreboard players operation @a[name=$(player),limit=1] macro.pid = $next_pid macro.tmp

execute store result storage macro:engine _pid_seq int 1 run scoreboard players get $next_pid macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/internal/assign_pid ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → pid=","color":"#555555"},{"score":{"name":"$next_pid","objective":"macro.tmp"},"color":"green"}]
