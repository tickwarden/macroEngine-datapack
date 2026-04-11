# macro:cmd/other/multi_cmd/internal/cond_tag_simple
# Simple string tag check

data modify storage macro:engine _mcmd_cond_tmp set value {}
data modify storage macro:engine _mcmd_cond_tmp.tag set from storage macro:engine _mcmd_current.condition.tag
function macro:cmd/other/multi_cmd/internal/cond_tag_exec with storage macro:engine _mcmd_cond_tmp
data remove storage macro:engine _mcmd_cond_tmp
