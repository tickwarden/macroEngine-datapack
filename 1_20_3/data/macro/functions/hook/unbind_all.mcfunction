# macro:hook/unbind_all
# Clears all hook binds.

data modify storage macro:engine hook_binds set value []

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"hook/unbind_all ","color":"aqua"},{"text":"⚠ all hook binds cleared","color":"yellow"}]
