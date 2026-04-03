function macro:disable/main

tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"Engine disabled. ","color":"red"},{"text":"Restart → ","color":"#555555"},{"text":"[Click here]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/function macro:load"},"hoverEvent":{"action":"show_text","contents":"/function macro:load"}}]}