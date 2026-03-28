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

# Hook module cleanup
scoreboard objectives remove macro.hook_online
scoreboard objectives remove macro.hook_deaths
scoreboard objectives remove macro.hook_placed
scoreboard objectives remove macro.hook_lvl
scoreboard objectives remove macro.hook_lvl_new
scoreboard objectives remove macro.hook_sneak
scoreboard objectives remove macro.hook_sprint
scoreboard objectives remove macro.hook_elytra
tag @a remove macro.hook_dead
tag @a remove macro.hook_sneaking
tag @a remove macro.hook_sprinting
tag @a remove macro.hook_gliding
scoreboard objectives remove macro.hook_tool_used
scoreboard objectives remove macro.hook_item_used
scoreboard objectives remove macro.hook_entity_killed
scoreboard objectives remove macro.hook_using_item
scoreboard objectives remove macro.hook_killed_by_arrow
scoreboard objectives remove macro.hook_hero_of_the_village
data remove storage macro:engine hook_binds
data remove storage macro:engine _hook_iter
data remove storage macro:engine _hook_ctx
data remove storage macro:engine _hook_fire_event
data remove storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_unbinds
data remove storage macro:engine _hook_filter_event
