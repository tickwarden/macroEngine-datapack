# Load — entry point called from minecraft:load tag via macro:load
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

# Lantern Load integration — set pack version in load.status
# Format: (major * 10000) + (minor * 100) + patch
# Example: v2.2.6 = 20206
execute store result score #version_calc macro.tmp run scoreboard players get #ame.major ame.pre_version
scoreboard players operation #version_calc macro.tmp *= #10000 macro.tmp
execute store result score #temp macro.tmp run scoreboard players get #ame.minor ame.pre_version
scoreboard players operation #temp macro.tmp *= #100 macro.tmp
scoreboard players operation #version_calc macro.tmp += #temp macro.tmp
scoreboard players operation #version_calc macro.tmp += #ame.patch ame.pre_version
scoreboard players operation macroEngine load.status = #version_calc macro.tmp

execute if score #ame.pre ame.pre_version matches 1.. run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"Loaded. ","color":"green"},[{"text":"v","color":"aqua"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":"-pre","color":"#ff8800"},{"score":{"name":"#ame.pre","objective":"ame.pre_version"},"color":"#ff8800","bold":true}]]
execute if score #ame.pre ame.pre_version matches ..0 run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"Loaded. ","color":"green"},[{"text":"v","color":"aqua"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"aqua","bold":true},{"text":".","color":"aqua"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"aqua","bold":true}]]

data modify storage macro:input level set value "Advanced Macro Engine"
data modify storage macro:input message set value "Loaded."
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}

function ame_load:load/internal/finalize
