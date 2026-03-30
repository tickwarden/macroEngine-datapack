execute unless entity @s[tag=macro.admin] run return run tellraw @s {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]}

$data remove storage macro:engine permissions.$(player)
$advancement revoke @a[name=$(player),limit=1] from macro:hidden/root
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"perm/clear ","color":"aqua"},{"text":"⚠ ","color":"yellow"},{"text":"$(player)","color":"white"},{"text":" — all permissions cleared","color":"#555555"}]}
