# AME Tick — Channel Dispatcher
# Increments the internal tick counter then iterates all channels.

scoreboard players add #tick_ctr macro.tick 1
data modify storage macro:tick_work i set value 0
function macro:tick/dispatch/step with storage macro:tick_work