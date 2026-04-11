execute unless data storage macro:engine _ia_ubinds[0] run return 0

data modify storage macro:engine _ia_ucur set from storage macro:engine _ia_ubinds[0]
data remove storage macro:engine _ia_ubinds[0]

function macro:interaction/internal/unbind_check with storage macro:engine _ia_ufilter

function macro:interaction/internal/unbind_filter
data remove storage macro:engine _ia_ucur
