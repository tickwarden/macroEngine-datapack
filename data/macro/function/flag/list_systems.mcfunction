# ============================================
# macro:flag/list_systems
# ============================================
# Tum tick sistemi flag'lerinin durumunu gosterir.
# Kullanim: /function macro:flag/list_systems
# ============================================

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ System Flags ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━━","color":"dark_gray"}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"time ","color":"white"},{"text":"#m_time ","color":"dark_gray"},{"score":{"name":"#m_time","objective":"macro.Flags"},"color":"green"}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"queue ","color":"white"},{"text":"#m_queue ","color":"dark_gray"},{"score":{"name":"#m_queue","objective":"macro.Flags"},"color":"green"}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"player ","color":"white"},{"text":"#m_player ","color":"dark_gray"},{"score":{"name":"#m_player","objective":"macro.Flags"},"color":"green"}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"hud ","color":"white"},{"text":"#m_hud ","color":"dark_gray"},{"score":{"name":"#m_hud","objective":"macro.Flags"},"color":"green"}]
tellraw @s ["",{"text":" ","color":"dark_gray"},{"text":"admin ","color":"white"},{"text":"#m_admin ","color":"dark_gray"},{"score":{"name":"#m_admin","objective":"macro.Flags"},"color":"green"}]
tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
