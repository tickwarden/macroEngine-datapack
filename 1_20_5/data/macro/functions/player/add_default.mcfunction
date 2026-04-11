$execute unless data storage macro:engine players.$(player).$(key) run data modify storage macro:engine players.$(player).$(key) set value $(value)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/add_default ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(key)","color":"aqua"}]}
