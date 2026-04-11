$team modify $(team) color $(color)
$data modify storage macro:engine teams.$(team).color set value "$(color)"
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"team/set_color ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(team)","color":"aqua"}]}
