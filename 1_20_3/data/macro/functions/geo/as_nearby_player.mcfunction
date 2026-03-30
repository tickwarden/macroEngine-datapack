$execute as @a[distance=..$(distance),limit=1,sort=nearest] at @s run function $(func)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"geo/as_nearby_player ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]}
