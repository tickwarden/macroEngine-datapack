# ─────────────────────────────────────────────
#  macro:version
#  Shows AME version info to the calling player.
#  Usage: /function macro:version
# ─────────────────────────────────────────────

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Version Info ","color":"aqua"},{"text":"━━━━━━━━━━━━━━","color":"#555555"}]

tellraw @s ["",{"text":"  ◈ ","color":"#00AAAA"},{"text":"Advanced Macro Engine","color":"white","bold":true}]

execute if score #ame.pre ame.pre_version matches 1.. run tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"Version   ","color":"gray"},{"text":"v","color":"#ffaa00"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"#ffaa00","bold":true},{"text":".","color":"#ffaa00"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"#ffaa00","bold":true},{"text":".","color":"#ffaa00"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"#ffaa00","bold":true},{"text":"-pre","color":"#ff8800"},{"score":{"name":"#ame.pre","objective":"ame.pre_version"},"color":"#ff8800","bold":true}]
execute if score #ame.pre ame.pre_version matches ..0 run tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"Version   ","color":"gray"},{"text":"v","color":"#ffaa00"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"#ffaa00","bold":true},{"text":".","color":"#ffaa00"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"#ffaa00","bold":true},{"text":".","color":"#ffaa00"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"#ffaa00","bold":true}]

tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"MC        ","color":"gray"},{"text":"1.21.x","color":"#e3ff57"},{"text":"  (pack_format 48–94)","color":"#555555"}]
tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"Author    ","color":"gray"},{"text":"tickwarden","color":"#00ff33"},{"text":"  /  ","color":"#555555"},{"text":"ToolkitMC","color":"aqua","underlined":true,"click_event":{"action":"open_url","url":"https://github.com/ToolkitMC/macroEngine-dp"}}]

tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"Source    ","color":"gray"},{"text":"github.com/ToolkitMC/macroEngine-dp","color":"#5555ff","underlined":true,"click_event":{"action":"open_url","url":"https://github.com/ToolkitMC/macroEngine-dp"}}]
# Check if loaded
execute if score #ame.ver_set ame.pre_version matches 1 run tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"Status    ","color":"gray"},{"text":"● loaded","color":"green"}]
execute unless score #ame.ver_set ame.pre_version matches 1 run tellraw @s ["",{"text":"  ┃ ","color":"#555555"},{"text":"Status    ","color":"gray"},{"text":"✖ not initialized","color":"red"}]

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
