# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/advanced/run_with_options
# Run with advanced options
#
# INPUT (storage macro:input):
# list → command list (string or object)
# options → {priority_sort:1b, spread_ticks:0, error_mode:"continue", profile:1b}
# ─────────────────────────────────────────────────────────────────

data modify storage macro:engine _mcmd_queue set from storage macro:input list
execute unless data storage macro:input options run data modify storage macro:input options set value {}
data modify storage macro:engine _mcmd_options merge from storage macro:input options

execute unless data storage macro:engine _mcmd_options.error_mode run data modify storage macro:engine _mcmd_options.error_mode set value "continue"
execute unless data storage macro:engine _mcmd_options.profile run data modify storage macro:engine _mcmd_options.profile set value 0b
execute unless data storage macro:engine _mcmd_options.spread_ticks run data modify storage macro:engine _mcmd_options.spread_ticks set value 0

execute if data storage macro:engine _mcmd_options{priority_sort:1b} run function macro:cmd/other/multi_cmd/advanced/internal/sort_by_priority
execute if data storage macro:engine _mcmd_options.spread_ticks unless data storage macro:engine _mcmd_options{spread_ticks:0} run return run function macro:cmd/other/multi_cmd/advanced/internal/run_spread

function macro:cmd/other/multi_cmd/run
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"multi_cmd/advanced ","color":"aqua"},{"text":"✔ with options","color":"green"}]
