# macro:hook/internal/on_advancement_fire [MACRO]
# INPUT: $(advancement)
# @s = player who earned the advancement

$data modify storage macro:engine _hook_fire_tmp set value {event:"advancement:$(advancement)"}
function macro:hook/internal/fire with storage macro:engine _hook_fire_tmp
data remove storage macro:engine _hook_fire_tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"hook/on_advancement_fire ","color":"aqua"},{"text":"advancement:$(advancement)","color":"yellow"}]
