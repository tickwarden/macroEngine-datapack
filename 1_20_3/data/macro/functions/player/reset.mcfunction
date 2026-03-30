$data remove storage macro:engine players.$(player)
$data remove storage macro:engine cooldowns.$(player)
$advancement revoke @a[name=$(player),limit=1] from macro:hidden/root
function macro:player/init with storage macro:input {}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/reset ","color":"aqua"},{"text":"$(player)","color":"white"}]}
