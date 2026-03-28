$item modify entity @a[name=$(player),limit=1] $(slot) $(modifier)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/item_modify ","color":"aqua"},{"text":"$(player)","color":"white"}]
