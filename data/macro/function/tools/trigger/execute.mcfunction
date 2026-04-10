# macro:tools/trigger — single-call dispatch layer (EC-style).
# Does not require EventCore; uses AME's own macro:cmd/* functions.
#
# Usage:
# function macro:tools/trigger {type:"<type>", data:{...}}
# function macro:tools/trigger {type:"<type>", data:{...}, config:{silent:1}}
#
# config:{silent:1} → suppress debug tellraw.

data modify storage macro:engine tools_trigger.data.uuid set from entity @s UUID

$data modify storage macro:engine tools_trigger.type set value "$(type)"
$data modify storage macro:engine tools_trigger.data set value $(data)

# Execute action
function macro:tools/trigger/internal/dispatch

# Debug message
$execute if data storage macro:engine tools_trigger.config{silent:1} run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"tools/trigger/execute ","color":"aqua"},{"text":"► ","color":"yellow"},{"text":"$(type)","color":"white"}]
execute if data storage macro:engine tools_trigger.config{silent:0} run function macro:tick/disabled

# Remove 'macro:engine tools_trigger' storage
data remove storage macro:engine tools_trigger