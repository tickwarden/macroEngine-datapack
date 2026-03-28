# ─────────────────────────────────────────────────────────────────
# macro:geo/region_watch/list
# Shows all registered regions to debug players.
# ─────────────────────────────────────────────────────────────────

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Region Watches ━━━━━━━━━━━━━━","color":"aqua"}]
execute if data storage macro:engine region_watches run tellraw @a[tag=macro.debug] ["",{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"region_watches","interpret":false,"color":"yellow"}]
execute unless data storage macro:engine region_watches run tellraw @a[tag=macro.debug] ["",{"text":" (no regions registered)","color":"gray","italic":true}]
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
