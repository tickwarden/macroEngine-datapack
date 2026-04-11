# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/utils/add_command
# Add a command to queue at runtime
#
# INPUT (storage macro:input):
# cmd or func → command/function to add
# ─────────────────────────────────────────────────────────────────

execute if data storage macro:input cmd run data modify storage macro:engine _mcmd_queue append value {}
execute if data storage macro:input cmd run data modify storage macro:engine _mcmd_queue[-1].cmd set from storage macro:input cmd

execute if data storage macro:input func run data modify storage macro:engine _mcmd_queue append value {}
execute if data storage macro:input func run data modify storage macro:engine _mcmd_queue[-1].func set from storage macro:input func

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"multi_cmd/utils/add ","color":"aqua"},{"text":"✔ added to queue","color":"green"}]
