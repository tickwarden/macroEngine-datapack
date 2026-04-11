execute unless data storage macro:engine _tc_binds[0] run return 0

data modify storage macro:engine _tc_current set from storage macro:engine _tc_binds[0]
data remove storage macro:engine _tc_binds[0]

execute store result score $tc_val macro.tmp run data get storage macro:engine _tc_current.value

execute if score $tc_player macro.tmp = $tc_val macro.tmp if data storage macro:engine _tc_current.func run function macro:trigger/internal/call with storage macro:engine _tc_current

execute if score $tc_player macro.tmp = $tc_val macro.tmp if data storage macro:engine _tc_current.cmd run function macro:trigger/internal/call2 with storage macro:engine _tc_current

function macro:trigger/internal/check_next
