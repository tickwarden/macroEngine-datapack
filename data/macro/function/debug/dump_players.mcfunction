# ─────────────────────────────────────────────────────────────────
#  macro:debug/dump_players
#  Shows all player variables (player vars), PIDs and their states.
#  Usage: /function macro:debug/dump_players
# ─────────────────────────────────────────────────────────────────

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Player State Dump ","color":"aqua"},{"text":"━━━━━━━━━━━━━","color":"#555555"}]
tellraw @s ["",{"text":"  ","color":"#555555"},{"text":"players ","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:engine","nbt":"players","color":"green","italic":false}]
tellraw @s ["",{"text":"  ","color":"#555555"},{"text":"pids    ","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:engine","nbt":"player_pids","color":"aqua","italic":false}]
tellraw @s ["",{"text":"  ","color":"#555555"},{"text":"perms   ","color":"white"},{"text":" → ","color":"#555555"},{"storage":"macro:engine","nbt":"permissions","color":"yellow","italic":false}]
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
