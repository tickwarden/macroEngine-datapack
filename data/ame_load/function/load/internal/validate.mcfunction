execute unless data storage macro:engine global run data modify storage macro:engine global set value {version:"v3.0.3"}
data modify storage macro:engine global.version set value "v3.0.3"

execute unless data storage macro:engine log_display run data modify storage macro:engine log_display set value []
execute unless score #ame.log_count macro.tmp matches 0.. run scoreboard players set #ame.log_count macro.tmp 0

execute if data storage macro:engine global{loaded:1b} run data modify storage macro:input message set value "Already loaded — skipping reload."
execute if data storage macro:engine global{loaded:1b} run function macro:log/warn with storage macro:input {}
execute if data storage macro:engine global{loaded:1b} run return 0

scoreboard objectives add ame.pre_version dummy
scoreboard players set #ame.mismatch ame.pre_version 0
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.major ame.pre_version matches 3 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.minor ame.pre_version matches 0 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.patch ame.pre_version matches 3 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.pre ame.pre_version matches 0 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.mismatch ame.pre_version matches 1 run function ame_load:load/internal/version_warn
execute if score #ame.mismatch ame.pre_version matches 1 run return 0

return 1
# StringLib dependency check
execute unless score #StringLib.Init StringLib matches 1 run tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"WARN","color":"gold","bold":true},{"text":" StringLib not initialized — macro:lib/string/* unavailable","color":"yellow"}]
