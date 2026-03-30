$playsound $(sound) master @a ~ ~ ~ $(volume) $(pitch)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/sound_all ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(sound)","color":"aqua"}]}
