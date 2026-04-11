execute unless data storage macro:engine _pt_names_tmp[0] run return 0

data modify storage macro:engine _pt_tick_ctx set from storage macro:engine _pt_names_tmp[0]
data remove storage macro:engine _pt_names_tmp[0]

function macro:perm/trigger/internal/tick_dispatch with storage macro:engine _pt_tick_ctx

function macro:perm/trigger/internal/tick_step_loop
