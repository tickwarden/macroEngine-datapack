execute unless data storage macro:engine global run data modify storage macro:engine global set value {version:"v2.0.4-pre1"}

execute unless data storage macro:engine log_display run data modify storage macro:engine log_display set value []
execute unless score #ame.log_count macro.tmp matches 0.. run scoreboard players set #ame.log_count macro.tmp 0

execute if data storage macro:engine global{loaded:1b} run data modify storage macro:input message set value "Already loaded — skipping reload."
execute if data storage macro:engine global{loaded:1b} run function macro:log/warn with storage macro:input {}
execute if data storage macro:engine global{loaded:1b} run return 0

execute unless data storage macro:engine global{version:"v2.0.4-pre1"} run data modify storage macro:names temp.vers set value "v2.0.4-pre1"
execute unless data storage macro:engine global{version:"v2.0.4-pre1"} run tellraw @a [{"text":"[AME] ","color":"aqua","bold":true},{"text":"Version mismatch — expected ","color":"red"},{"storage":"macro:names","nbt":"temp.vers","color":"yellow"},{"text":".","color":"red"}]
execute unless data storage macro:engine global{version:"v2.0.4-pre1"} run return 0

scoreboard objectives add ame.pre_version dummy
scoreboard players set #ame.mismatch ame.pre_version 0
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.major ame.pre_version matches 2 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.minor ame.pre_version matches 0 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.patch ame.pre_version matches 3 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.pre ame.pre_version matches 0 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.mismatch ame.pre_version matches 1 run function ame_load:load/internal/version_warn
execute if score #ame.mismatch ame.pre_version matches 1 run return 0

return 1
