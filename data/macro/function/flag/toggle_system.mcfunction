$scoreboard players operation #ftgl_sys macro.tmp = #m_$(system) macro.Flags

$execute if score #ftgl_sys macro.tmp matches 1 run scoreboard players set #m_$(system) macro.Flags 0
$execute if score #ftgl_sys macro.tmp matches 0 run scoreboard players set #m_$(system) macro.Flags 1
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"flag/toggle_system ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(system)","color":"aqua"}]
