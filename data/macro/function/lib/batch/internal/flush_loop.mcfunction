# macro:lib/batch/internal/flush_loop
# Consumes _bfl_items. For each item:
#   delay = floor($bfl_idx * $bfl_spread / $bfl_total)
# computed and added to the queue.
# func or cmd presence is checked with execute if data.

execute unless data storage macro:engine _bfl_items[0] run return 0

# delay = floor(idx * spread / total)
scoreboard players operation $bfl_delay macro.tmp = $bfl_idx macro.tmp
scoreboard players operation $bfl_delay macro.tmp *= $bfl_spread macro.tmp
scoreboard players operation $bfl_delay macro.tmp /= $bfl_total macro.tmp

# Move item to temporary storage
data modify storage macro:engine _bfl_cur set from storage macro:engine _bfl_items[0]
data remove storage macro:engine _bfl_items[0]

# Write delay to item, then queue by func/cmd
execute store result storage macro:engine _bfl_cur.delay int 1 run scoreboard players get $bfl_delay macro.tmp

execute if data storage macro:engine _bfl_cur.func run function macro:lib/batch/internal/flush_queue_func with storage macro:engine _bfl_cur
execute unless data storage macro:engine _bfl_cur.func run execute if data storage macro:engine _bfl_cur.cmd run function macro:lib/batch/internal/flush_queue_cmd with storage macro:engine _bfl_cur

data remove storage macro:engine _bfl_cur
scoreboard players add $bfl_idx macro.tmp 1

function macro:lib/batch/internal/flush_loop