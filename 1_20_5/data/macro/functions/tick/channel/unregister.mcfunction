# macro:tick/channel/unregister — Remove a tick channel by ID
# Usage: function macro:tick/channel/unregister {id:"channel_id"}
$data remove storage macro:engine tick.channels[{id:"$(id)"}]