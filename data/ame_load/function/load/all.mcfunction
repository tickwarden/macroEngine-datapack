# Send Debug Message
summon minecraft:marker 0 -64 0 {Tags:["ame.init"],CustomName:{text:"AME/Load",italic:0b,color:"gold",bold:1b}}
execute as @e[type=minecraft:marker,limit=1,tag=ame.init] run say Loading...
kill @e[type=minecraft:marker,tag=ame.init]

# Load
forceload add -30000000 1600

execute unless function ame_load:load/internal/validate run return 0

data modify storage macro:input level set value "A.M.E."
data modify storage macro:input message set value "Starting..."
data modify storage macro:input color set value "aqua"
function macro:log/add with storage macro:input {}

function ame_load:load/scoreboards

function ame_load:load/storages

function ame_load:load/other

data modify storage macro:engine global.loaded set value 1b

function ame_load:load/internal/version_set

execute if score #ame.pre ame.pre_version matches 1.. run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"Loaded. ","color":"green"},[{"text":"v","color":"aqua"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":"-pre","color":"#ff8800"},{"score":{"name":"#ame.pre","objective":"ame.pre_version"},"color":"#ff8800","bold":true}]]
execute if score #ame.pre ame.pre_version matches ..0 run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"Loaded. ","color":"green"},[{"text":"v","color":"aqua"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua","bold":true}]]

data modify storage macro:input sound set value "minecraft:ui.toast.challenge_complete"
data modify storage macro:input volume set value 1
data modify storage macro:input pitch set value 1
function macro:cmd/sound_all with storage macro:input {}
data remove storage macro:input sound
data remove storage macro:input volume
data remove storage macro:input pitch

data modify storage macro:input level set value "Advanced Macro Engine"
data modify storage macro:input message set value "Loaded."
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}

function ame_load:load/internal/finalize