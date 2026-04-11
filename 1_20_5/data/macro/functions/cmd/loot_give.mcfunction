$loot give @a[name=$(player),limit=1] loot $(loot_table)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/loot_give ","color":"aqua"},{"text":"$(player)","color":"white"}]}
