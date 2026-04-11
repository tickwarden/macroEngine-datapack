$team remove $(team)
$data remove storage macro:engine teams.$(team)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"team/delete ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(team)","color":"aqua"}]}
