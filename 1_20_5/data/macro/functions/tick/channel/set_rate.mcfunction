# macro:tick/channel/set_rate — Change execution rate (every N ticks, min 1)
# Usage: function macro:tick/channel/set_rate {id:"channel_id",rate:20}
$data modify storage macro:engine tick.channels[{id:"$(id)"}] merge value {rate:$(rate)}