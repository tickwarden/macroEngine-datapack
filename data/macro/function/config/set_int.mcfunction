$execute store result storage macro:engine config.$(key) int 1 run scoreboard players set $cfg_tmp macro.tmp $(value)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"config/set_int ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]
