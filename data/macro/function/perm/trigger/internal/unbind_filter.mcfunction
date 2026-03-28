execute unless data storage macro:engine _pt_unbind[0] run return 0

execute store result score $pt_fval macro.tmp run data get storage macro:engine _pt_unbind[0].value
execute store result score $pt_uval macro.tmp run data get storage macro:engine _pt_uval

execute unless score $pt_fval macro.tmp = $pt_uval macro.tmp run function macro:perm/trigger/internal/unbind_reinsert with storage macro:engine _pt_filter_ctx

data remove storage macro:engine _pt_unbind[0]
function macro:perm/trigger/internal/unbind_filter
