$advancement revoke @a[name=$(player),limit=1] only $(advancement)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/advancement_revoke ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(advancement)","color":"aqua"}]}
