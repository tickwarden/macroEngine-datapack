# AME - World Clock Rate Controller
$time rate $(rate)

# System Debug Log for staff (Only for users with 'macro.debug' tag)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"clock/rate_updated ","color":"aqua"},{"text":"* ","color":"white"},{"text":"to ","color":"gray"},{"text":"$(rate)x","color":"gold"}]