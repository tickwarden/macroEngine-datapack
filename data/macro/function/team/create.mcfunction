$team add $(team)
$data modify storage macro:engine teams.$(team) set value {color:"white",friendly_fire:"true",see_friendly_invisibles:"false"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"team/create ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(team)","color":"aqua"}]
