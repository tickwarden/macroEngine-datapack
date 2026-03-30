tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Config Values ","color":"aqua"},{"text":"━━━━━━━━━━━","color":"#555555"}]}
execute if data storage macro:engine config run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"config","interpret":false,"color":"green"}]}
execute unless data storage macro:engine config run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"text":"(no config values set)","color":"gray","italic":true}]}
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]}
