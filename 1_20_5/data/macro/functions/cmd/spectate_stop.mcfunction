$execute as @a[name=$(player),limit=1] run spectate
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/spectate_stop ","color":"aqua"},{"text":"$(player)","color":"white"}]}
