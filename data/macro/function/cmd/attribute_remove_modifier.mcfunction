$attribute @a[name=$(player),limit=1] $(attribute) modifier remove $(id)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/attribute_remove_modifier ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(id)","color":"aqua"}]
