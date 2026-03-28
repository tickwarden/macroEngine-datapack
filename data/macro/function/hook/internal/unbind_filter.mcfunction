# macro:hook/internal/unbind_filter
# _hook_unbinds listesini iterate eder.
# Copies back binds that do not match _hook_filter_event to hook_binds.

execute unless data storage macro:engine _hook_unbinds[0] run return 0

data modify storage macro:engine _hook_unbinds[0] set from storage macro:engine _hook_unbinds[0]

function macro:hook/internal/unbind_check with storage macro:engine _hook_unbinds[0]

data remove storage macro:engine _hook_unbinds[0]

function macro:hook/internal/unbind_filter
