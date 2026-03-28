# macro:wand/unregister_all — Clears all wand binds.
data modify storage macro:engine wand_binds set value []
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/unregister_all ","color":"aqua"},{"text":"⚠ all wand binds cleared","color":"yellow"}]
