# Tag object checker - {name:"...", has:1b/0b}

data modify storage macro:engine _mcmd_cond_tmp set from storage macro:engine _mcmd_current.condition.tag
execute unless data storage macro:engine _mcmd_cond_tmp.has run data modify storage macro:engine _mcmd_cond_tmp.has set value 1b

function macro:cmd/other/multi_cmd/internal/cond_tag_obj_exec with storage macro:engine _mcmd_cond_tmp
data remove storage macro:engine _mcmd_cond_tmp
