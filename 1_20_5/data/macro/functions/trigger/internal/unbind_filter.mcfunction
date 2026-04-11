execute unless data storage macro:engine _tc_unbind[0] run return 0

execute store result score $tc_fval macro.tmp run data get storage macro:engine _tc_unbind[0].value

execute store result score $tc_uval macro.tmp run data get storage macro:engine _tc_uval

execute unless score $tc_fval macro.tmp = $tc_uval macro.tmp run data modify storage macro:engine trigger_binds append from storage macro:engine _tc_unbind[0]

data remove storage macro:engine _tc_unbind[0]
function macro:trigger/internal/unbind_filter
