# ═══════════════════════════════════════
# macro:debug — AME Debug Inspector
# ═══════════════════════════════════════

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Debug Inspector ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━","color":"dark_gray"}]

tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.global ","color":"white"},{"storage":"macro:engine","nbt":"global","color":"aqua","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.players ","color":"white"},{"storage":"macro:engine","nbt":"players","color":"aqua","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.cooldowns ","color":"white"},{"storage":"macro:engine","nbt":"cooldowns","color":"yellow","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.queue ","color":"white"},{"storage":"macro:engine","nbt":"queue","color":"gold","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.events ","color":"white"},{"storage":"macro:engine","nbt":"events","color":"light_purple","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.config ","color":"white"},{"storage":"macro:engine","nbt":"config","color":"green","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"engine.flags ","color":"white"},{"storage":"macro:engine","nbt":"flags","color":"green","italic":false}]

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"I/O ","color":"aqua"},{"text":"─────────────────────────────────","color":"dark_gray"}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"input ","color":"white"},{"storage":"macro:input","nbt":"","color":"green","italic":false}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"output ","color":"white"},{"storage":"macro:output","nbt":"","color":"aqua","italic":false}]

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
