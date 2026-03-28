# AME - Swing & Feedback Module
$swing @a[name=$(player),limit=1] $(hand)

# System Debug Log for staff (Only for users with 'macro.debug' tag)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/swing ","color":"aqua"},{"text":"$(player)","color":"white"}]