$team modify $(team) friendlyFire $(value)
$data modify storage macro:engine teams.$(team).friendly_fire set value "$(value)"
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"team/set_friendly_fire ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(team)","color":"aqua"}]}
