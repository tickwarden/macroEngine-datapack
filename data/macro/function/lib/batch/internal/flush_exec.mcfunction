# macro:lib/batch/internal/flush_exec [MACRO]
# INPUT: $(id)
# For each item, delay = floor(idx * spread_over / total) is computed.
# Item'lar tek tek process_queue'ya eklenir — slice storage gerekmez.

$execute unless data storage macro:engine batches.$(id) run return 0

# Load total and spread_over values to score
$execute store result score $bfl_total macro.tmp run data get storage macro:engine batches.$(id).items
$execute store result score $bfl_spread macro.tmp run data get storage macro:engine batches.$(id).spread_over
execute if score $bfl_spread macro.tmp matches ..0 run scoreboard players set $bfl_spread macro.tmp 1
execute if score $bfl_total macro.tmp matches 0 run return 0

# Iteration counter
scoreboard players set $bfl_idx macro.tmp 0

# Copy items to working storage
$data modify storage macro:engine _bfl_items set from storage macro:engine batches.$(id).items
$data modify storage macro:engine _bfl_id set value "$(id)"

function macro:lib/batch/internal/flush_loop

data remove storage macro:engine _bfl_items
data remove storage macro:engine _bfl_id
scoreboard players reset $bfl_idx macro.tmp
scoreboard players reset $bfl_total macro.tmp
scoreboard players reset $bfl_spread macro.tmp

$data remove storage macro:engine batches.$(id)

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/batch/flush ","color":"aqua"},{"text":"$(id)","color":"white"},{"text":" — queued","color":"green"}]
