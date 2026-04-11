$execute store result storage macro:output result double 1 run attribute @a[name=$(player),limit=1] $(attribute) modifier value get $(id)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/attribute_get_modifier ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(id)","color":"aqua"}]}
