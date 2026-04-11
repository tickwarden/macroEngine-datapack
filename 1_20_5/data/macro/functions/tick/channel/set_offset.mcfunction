# macro:tick/channel/set_offset — Change phase offset (0 to rate-1)
# Usage: function macro:tick/channel/set_offset {id:"channel_id",offset:5}
$data modify storage macro:engine tick.channels[{id:"$(id)"}] merge value {offset:$(offset)}