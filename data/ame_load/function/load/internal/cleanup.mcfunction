schedule clear macro:lib/sync_tick

forceload remove 0 0

scoreboard players reset @a macro_menu
scoreboard players reset @a macro_run

scoreboard players reset $tick macro.tmp
scoreboard players reset $pq_depth macro.tmp
# $epoch intentionally preserved — cooldown expiry times depend on it

data remove storage macro:engine queue
data remove storage macro:engine events
data remove storage macro:engine event_context
data remove storage macro:engine _event_tmp
data remove storage macro:engine cooldowns
data remove storage macro:engine throttle
data remove storage macro:engine players
data remove storage macro:engine flags
data remove storage macro:engine states
data remove storage macro:engine schedules
data remove storage macro:engine _input_stack
data remove storage macro:engine _repeat
data remove storage macro:engine _rng_state
data remove storage macro:engine _felist_input
data remove storage macro:engine _felist_state
data remove storage macro:engine _felist_current
data remove storage macro:engine _felist_i
data remove storage macro:engine log_display
scoreboard players reset #ame.log_count macro.tmp
data remove storage macro:engine trigger_binds
data remove storage macro:engine _tc_binds
data remove storage macro:engine _tc_current
data remove storage macro:engine _tc_unbind
data remove storage macro:engine _tc_uval
data remove storage macro:engine interaction_binds
data remove storage macro:engine _ia_iter
data remove storage macro:engine _ia_cur
data remove storage macro:engine _ia_ubinds
data remove storage macro:engine _ia_ufilter
data remove storage macro:engine _ia_ucur
data remove storage macro:engine teams
data remove storage macro:engine global
data remove storage macro:output result

scoreboard objectives remove macro.tmp
scoreboard objectives remove macro.time
scoreboard objectives remove macro_menu
scoreboard objectives remove macro_run
scoreboard objectives remove macro_action
scoreboard objectives remove macro.tick_guard
scoreboard objectives remove macro.dialog_load
scoreboard objectives remove health
scoreboard objectives remove ame.pre_version

tag @a remove macro.dialog_opened
tag @a remove macro.dialog_closed
advancement revoke @a from macro:hidden/root

scoreboard objectives remove macro.pid
scoreboard objectives remove macro.rightClick
data remove storage macro:engine wand_binds
data remove storage macro:engine _wand_iter
data remove storage macro:engine _wand_current
data remove storage macro:engine _wand_unbinds
data remove storage macro:engine _wand_filter_tag
data remove storage macro:engine _wand_cur
data remove storage macro:engine player_pids
data remove storage macro:engine _pid_seq
