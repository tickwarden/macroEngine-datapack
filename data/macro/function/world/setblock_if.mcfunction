$execute if block $(x) $(y) $(z) $(expected) run setblock $(x) $(y) $(z) $(new_block) $(mode)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"world/setblock_if ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(mode)","color":"aqua"}]
