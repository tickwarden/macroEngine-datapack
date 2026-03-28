execute unless data storage macro:engine dialog.DIALOG run return 0

scoreboard players set @s macro.dialog_load -1
tag @s remove macro.dialog_closed
tag @s remove macro.dialog_opened
tag @s add macro.dialog_opened

tellraw @s ["",{"text":"[AME] ","color":"aqua","bold":true},{"text":"Dialog: ","color":"gray"},{"nbt":"dialog.DIALOG","storage":"macro:engine","color":"yellow"},{"text":" — ","color":"#555555"},{"text":"[Load]","color":"green","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function macro:load"},"hoverEvent":{"action":"show_text","value":{"text":"Upgrade to 1.21.6+ for native dialog support","color":"gray"}}}]

return 1
