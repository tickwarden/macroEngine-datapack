function macro:event/internal/uro_check with storage macro:engine _uro.src[0]
data remove storage macro:engine _uro.src[0]
execute if data storage macro:engine _uro.src[0] run function macro:event/internal/uro_loop
