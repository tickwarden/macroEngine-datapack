# [MACRO] Internal exec for flag/toggle_system
$execute if data storage macro:tick_work _ftgl{enabled:1b} run function macro:tick/channel/disable {id:"$(id)"}
$execute unless data storage macro:tick_work _ftgl{enabled:1b} run function macro:tick/channel/enable {id:"$(id)"}