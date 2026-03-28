data modify storage macro:engine _ia_cur set from storage macro:engine _ia_iter[0]
data remove storage macro:engine _ia_iter[0]

function macro:interaction/internal/check_bind with storage macro:engine _ia_cur

execute if data storage macro:engine _ia_iter[0] run function macro:interaction/internal/dispatch
