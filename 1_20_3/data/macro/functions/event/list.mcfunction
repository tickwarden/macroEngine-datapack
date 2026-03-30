tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Registered Events ","color":"aqua"},{"text":"━━━━━━","color":"#555555"}]}
execute if data storage macro:engine events run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"events","interpret":false,"color":"yellow"}]}
execute unless data storage macro:engine events run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"text":"(no registered events)","color":"gray","italic":true}]}
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]}
