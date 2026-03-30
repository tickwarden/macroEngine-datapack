$execute as @a[name=$(player),limit=1] at @s run tp @s $(x) $(y) $(z)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/tp ","color":"aqua"},{"text":"$(player)","color":"white"}]}
