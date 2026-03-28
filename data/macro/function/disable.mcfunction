playsound minecraft:block.note_block.pling master @s ~ ~ ~ 4 2

function macro:disable/main

tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"Engine disabled. ","color":"red"},{"text":"Restart → ","color":"#555555"},{"text":"[Click here]","color":"aqua","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function macro:load"},"hover_event":{"action":"show_text","value":"/function macro:load"}}]
