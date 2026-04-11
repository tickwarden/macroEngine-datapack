$execute as @a[name=$(player),limit=1] at @s run title @s times $(fade_in) $(stay) $(fade_out)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/title_times ","color":"aqua"},{"text":"$(player)","color":"white"}]}
