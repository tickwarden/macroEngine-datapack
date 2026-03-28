$data modify storage macro:input message set value "$(message)"
data modify storage macro:input level set value "ERROR"
data modify storage macro:input color set value "red"
function macro:log/add with storage macro:input {}
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"log/error ","color":"aqua"}]
