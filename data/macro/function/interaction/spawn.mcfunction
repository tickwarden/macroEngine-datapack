$summon minecraft:interaction ~ ~ ~ {width:$(width), height:$(height), response:$(response), Tags:["macro.interaction","macro.ia_new"]}

$tag @e[type=minecraft:interaction,tag=macro.ia_new,limit=1,sort=nearest] add $(tag)
tag @e[tag=macro.ia_new] remove macro.ia_new

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"interaction/spawn ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"},{"text":" spawned","color":"#555555"}]
