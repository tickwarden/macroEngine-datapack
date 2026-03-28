# macro:wand/internal/dispatch
# Called as @s. Compare held items with the bind list.

data modify storage macro:engine _wand_iter set from storage macro:engine wand_binds
execute if data storage macro:engine _wand_iter[0] run function macro:wand/internal/check_next
data remove storage macro:engine _wand_iter
data remove storage macro:engine _wand_current
