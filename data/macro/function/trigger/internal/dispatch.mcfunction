scoreboard players operation $tc_player macro.tmp = @s macro_action

scoreboard players set @s macro_action 0
scoreboard players enable @s macro_action

execute unless data storage macro:engine trigger_binds[0] run return 0

data modify storage macro:engine _tc_binds set from storage macro:engine trigger_binds

function macro:trigger/internal/check_next
data remove storage macro:engine _tc_binds
data remove storage macro:engine _tc_current
