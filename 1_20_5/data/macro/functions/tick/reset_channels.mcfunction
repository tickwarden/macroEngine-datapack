# macro:tick/reset_channels — Overwrite channel storage with config file defaults
# WARNING: this discards ALL runtime API changes (enable/disable/set_rate/etc.)
function macro:tick/config
tellraw @s [{"text":"[AME] ","color":"gold"},{"text":"Tick channels reset to defaults.","color":"green"}]