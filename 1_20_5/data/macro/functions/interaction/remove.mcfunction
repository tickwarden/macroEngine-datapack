$kill @e[type=minecraft:interaction,tag=$(tag)]

$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/remove ","color":"aqua"},{"text":"✘ ","color":"red"},{"text":"$(tag)","color":"white"},{"text":" killed","color":"#555555"}]}
