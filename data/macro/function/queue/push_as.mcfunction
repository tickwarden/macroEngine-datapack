# macro:queue/push_as
# Appends a function to the work queue, tagged to execute AS a specific player.
# The player must be online when the item is processed; if offline, it is skipped.
#
# Input  (macro:input queue):
#   fn     — function path          e.g. "mypack:process_player"
#   player — player name or UUID    e.g. "<player name>"
#
# Usage:
#   data modify storage macro:input queue set value {fn:"mypack:process_player",player:"<player name>"}
#   function macro:queue/push_as with storage macro:input queue

$data modify storage macro:engine work_queue append value {fn:"$(fn)",player:"$(player)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"queue/push_as ","color":"aqua"},{"text":"→ ","color":"#555555"},{"text":"$(fn)","color":"white"},{"text":" as ","color":"#555555"},{"text":"$(player)","color":"#FFAA00"}]
