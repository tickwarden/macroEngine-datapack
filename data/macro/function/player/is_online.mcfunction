# ─────────────────────────────────────────────────────────────────
#  macro:player/is_online
#  Checks whether the player is on the server.
#  Girdi : $(player) → player name
#  Output: macro:output result → 1b (online) / 0b (offline)
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output result set value 0b
$execute if entity @a[name=$(player),limit=1] run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/is_online ","color":"aqua"},{"text":"$(player) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
