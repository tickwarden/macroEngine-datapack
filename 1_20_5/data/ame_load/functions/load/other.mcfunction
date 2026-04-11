forceload add 0 0

data modify storage macro:input func set value "macro:lib/sync_tick"
data modify storage macro:input interval set value 20
data modify storage macro:input key set value "sync_tick"
function macro:lib/schedule with storage macro:input {}
data remove storage macro:input func
data remove storage macro:input interval
data remove storage macro:input key

scoreboard players enable @a[tag=macro.admin] macro_menu
scoreboard players enable @a[tag=macro.admin] macro_run
scoreboard players enable @a[tag=macro.admin] macro_action

# Initialize tick channel config on first world load
function macro:tick/init_channels
