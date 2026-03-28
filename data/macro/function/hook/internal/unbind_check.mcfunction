# macro:hook/internal/unbind_check [MACRO]
# INPUT: $(event) — event field of the current bind
# If it does not match _hook_filter_event, put back into hook_binds.

$execute unless data storage macro:engine {_hook_filter_event:"$(event)"} run data modify storage macro:engine hook_binds append from storage macro:engine _hook_unbinds[0]
