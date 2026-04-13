# ame_load:gate/exec/ban_ip
# Executor for confirmed ban-ip command.
# Called by ame_load:gate/yes via: function ... with storage macro:engine pending_gate
#
# Macro fields required in macro:engine pending_gate:
#   player  — target player name or UUID (resolves to IP)
#   reason  — ban reason string

$ban-ip $(player) $(reason)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/ban_ip ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" — reason: ","color":"gray"},{"text":"$(reason)","color":"yellow"}]
