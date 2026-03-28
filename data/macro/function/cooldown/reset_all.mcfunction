# ─────────────────────────────────────────────────────────────────
#  macro:cooldown/reset_all
#  Clears all active cooldowns for a player.
#  Girdi : $(player) → player name
#  Output: (side effect only)
#
#  Example:
#    data modify storage macro:input player set value "Steve"
#    function macro:cooldown/reset_all with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$data remove storage macro:engine cooldowns.$(player)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/reset_all ","color":"aqua"},{"text":"$(player) all cooldowns cleared","color":"yellow"}]
