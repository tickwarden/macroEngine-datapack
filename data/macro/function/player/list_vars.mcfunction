# ============================================
# macro:player/list_vars
# ============================================
# Shows all player variables and cooldowns as debug output.
# INPUT: macro:input { player:"<n>" }
# ============================================

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Player: ","color":"aqua"},{"text":"$(player)","color":"white","bold":true},{"text":" ━━━━━━━━━━━━━━","color":"dark_gray"}]
$execute if data storage macro:engine players.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" vars ","color":"dark_gray"},{"storage":"macro:engine","nbt":"players.$(player)","interpret":false,"color":"yellow"}]
$execute unless data storage macro:engine players.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" vars ","color":"dark_gray"},{"text":"(no data)","color":"gray","italic":true}]
$execute if data storage macro:engine cooldowns.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" cooldowns ","color":"dark_gray"},{"storage":"macro:engine","nbt":"cooldowns.$(player)","interpret":false,"color":"aqua"}]
$execute unless data storage macro:engine cooldowns.$(player) run tellraw @a[tag=macro.debug] ["",{"text":" cooldowns ","color":"dark_gray"},{"text":"(none active)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
