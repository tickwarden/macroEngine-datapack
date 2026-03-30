tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Global Flags ","color":"aqua"},{"text":"━━━━━━━━━━━","color":"#555555"}]}
execute if data storage macro:engine flags run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"flags","interpret":false,"color":"white"}]}
execute unless data storage macro:engine flags run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"text":"(no active flags)","color":"gray","italic":true}]}
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━","color":"#555555"}]}
