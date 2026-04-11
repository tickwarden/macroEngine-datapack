# AME Tick — Channel Loader [MACRO]
# Copies channels[i] into work storage, skips if disabled.
# Input: $(i) — channel index

$data modify storage macro:tick_work channel set from storage macro:engine tick.channels[$(i)]
execute unless data storage macro:tick_work channel{enabled:1b} run return 0
function macro:tick/dispatch/rate_check with storage macro:tick_work channel