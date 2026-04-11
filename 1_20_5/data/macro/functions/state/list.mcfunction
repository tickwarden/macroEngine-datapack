tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━ Player States ","color":"aqua"},{"text":"━━━━━━━━━━","color":"#555555"}]}
execute if data storage macro:engine states run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"storage":"macro:engine","nbt":"states","interpret":false,"color":"white"}]}
execute unless data storage macro:engine states run tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":" ","color":"#555555"},{"text":"(no active states)","color":"gray","italic":true}]}
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]}
