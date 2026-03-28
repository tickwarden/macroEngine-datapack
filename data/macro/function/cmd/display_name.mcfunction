$data modify entity @e[type=$(type),tag=$(tag),limit=1] CustomName set value '$(name)'
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/display_name ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(type)","color":"aqua"}]
