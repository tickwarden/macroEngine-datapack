# macro:cooldown/resume
# Resumes a previously paused cooldown.
# Params: player, key
# Output: macro:output result (new expiry epoch tick), 0b if not paused

data modify storage macro:output result set value 0b

$execute unless data storage macro:engine paused_cooldowns.$(player).$(key) run return 0

# Reconstruct expiry: now + saved remaining ticks
$execute store result score $cdr_rem macro.tmp run data get storage macro:engine paused_cooldowns.$(player).$(key)
execute store result score $cdr_now macro.tmp run scoreboard players get $epoch macro.time
scoreboard players operation $cdr_now macro.tmp += $cdr_rem macro.tmp

# Write back to live cooldowns, remove from paused
$execute store result storage macro:engine cooldowns.$(player).$(key) int 1 run scoreboard players get $cdr_now macro.tmp
$data remove storage macro:engine paused_cooldowns.$(player).$(key)
execute store result storage macro:output result int 1 run scoreboard players get $cdr_now macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/resume ","color":"aqua"},{"text":"▶ ","color":"green"},{"text":"$(player)","color":"white"},{"text":":","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" resumed (","color":"#555555"},{"score":{"name":"$cdr_rem","objective":"macro.tmp"},"color":"yellow"},{"text":"t remaining)","color":"#555555"}]
