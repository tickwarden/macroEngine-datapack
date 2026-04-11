$attribute @a[name=$(player),limit=1] $(attribute) modifier add $(id) $(amount) $(operation)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/attribute_add_modifier ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(id)","color":"aqua"}]}
