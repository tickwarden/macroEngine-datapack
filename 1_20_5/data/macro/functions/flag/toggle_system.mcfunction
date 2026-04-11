# macro:flag/toggle_system — Toggle a built-in tick channel on/off
# Usage: function macro:flag/toggle_system {system:"time"}
# Valid systems: time | queue | player | hud | admin
# Delegates to macro:tick/channel/enable|disable internally.

$data modify storage macro:tick_work _ftgl set from storage macro:engine tick.channels[{id:"$(system)_systems"}]
function macro:flag/toggle_system/exec with storage macro:tick_work _ftgl