execute unless score $epoch macro.time matches -2147483648..2147483647 run scoreboard players set $epoch macro.time 0
scoreboard players set $tick macro.tmp 0

scoreboard players set $pq_depth macro.tmp 0

scoreboard players set $pb_four macro.tmp 1

execute unless data storage macro:engine throttle run data modify storage macro:engine throttle set value {}

execute unless data storage macro:engine flags run data modify storage macro:engine flags set value {}
execute unless data storage macro:engine states run data modify storage macro:engine states set value {}

execute unless data storage macro:engine permissions run data modify storage macro:engine permissions set value {}

execute unless data storage macro:engine perm_triggers run data modify storage macro:engine perm_triggers set value {}
execute unless data storage macro:engine perm_trigger_names run data modify storage macro:engine perm_trigger_names set value []

execute unless data storage macro:engine trigger_binds run data modify storage macro:engine trigger_binds set value []

execute unless data storage macro:engine interaction_binds run data modify storage macro:engine interaction_binds set value {attack:[], use:[]}

execute unless data storage macro:engine player_pids run data modify storage macro:engine player_pids set value {}
execute unless data storage macro:engine _pid_seq run data modify storage macro:engine _pid_seq set value 0

# UUID modülü başlatma
function macro:uuid/internal/init

# once_per_player modülü başlatma
execute unless data storage macro:engine once_per_player run data modify storage macro:engine once_per_player set value {}

# Wand modülü başlatma
execute unless data storage macro:engine wand_binds run data modify storage macro:engine wand_binds set value []
