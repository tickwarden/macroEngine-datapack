# AME Tick — Dispatch Step [MACRO]
# Recursive iterator over tick.channels[].
# Terminates automatically when index exceeds array length.
# Input: $(i) — current channel array index

# Termination: channel[i] absent → stop
$execute unless data storage macro:engine tick.channels[$(i)] run return 0

# Process this channel
$function macro:tick/dispatch/channel {i:$(i)}

# Advance: $(i)+1 → write back → recurse
$scoreboard players set #ch_next macro.tick $(i)
scoreboard players add #ch_next macro.tick 1
execute store result storage macro:tick_work i int 1 run scoreboard players get #ch_next macro.tick
function macro:tick/dispatch/step with storage macro:tick_work