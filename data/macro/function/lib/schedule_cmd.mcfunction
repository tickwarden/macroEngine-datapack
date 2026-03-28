# ─────────────────────────────────────────────
#  macro:lib/schedule_cmd
#  Repeating command scheduler at a fixed interval.
#
#  Girdi (macro:input):
#    key      — scheduler name (unique identifier)
#    cmd      — raw command to run on each trigger
#    interval — repeat interval in ticks
# ─────────────────────────────────────────────

$execute if data storage macro:engine schedules.$(key) run data remove storage macro:engine schedules.$(key)

$data modify storage macro:engine schedules.$(key).cmd set value "$(cmd)"
$data modify storage macro:engine schedules.$(key).interval set value $(interval)
$data modify storage macro:engine queue append value {cmd:"$(cmd)", delay:$(interval)}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/schedule_cmd ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" ($(interval)t)","color":"#555555"}]
