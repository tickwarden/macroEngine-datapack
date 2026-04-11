$execute as @a[name=$(player),limit=1] run enchant @s $(enchantment) $(level)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/enchant ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(enchantment)","color":"aqua"}]}
