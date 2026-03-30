$data modify storage macro:input message set value "$(message)"
data modify storage macro:input level set value "DEBUG"
data modify storage macro:input color set value "gray"
function macro:log/add with storage macro:input {}
tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"log/debug ","color":"aqua"}]}
