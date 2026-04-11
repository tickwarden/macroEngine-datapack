# macro:tick/channel/set_condition — Set or clear condition predicate
# Usage: function macro:tick/channel/set_condition {id:"channel_id",condition:"ns:pred"}
# function macro:tick/channel/set_condition {id:"channel_id",condition:""} ← always-run
$data modify storage macro:engine tick.channels[{id:"$(id)"}] merge value {condition:"$(condition)"}