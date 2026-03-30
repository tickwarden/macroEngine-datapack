$execute as @a[name=$(player),limit=1] run attribute @s $(attribute) base set $(value)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/attribute_set ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(value)","color":"aqua"}]}
