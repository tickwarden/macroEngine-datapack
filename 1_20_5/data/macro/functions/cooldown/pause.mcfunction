# macro:cooldown/pause
# Pauses an active cooldown, saving the remaining ticks.
# Params: player, key
# Output: macro:output result (remaining ticks saved), 0b if not active

data modify storage macro:output result set value 0b

$execute unless data storage macro:engine cooldowns.$(player).$(key) run return 0

# Calculate remaining ticks
$execute store result score $cdp_exp macro.tmp run data get storage macro:engine cooldowns.$(player).$(key)
execute store result score $cdp_now macro.tmp run scoreboard players get $epoch macro.time
scoreboard players operation $cdp_exp macro.tmp -= $cdp_now macro.tmp

# Only pause if actually still active
execute unless score $cdp_exp macro.tmp matches 1.. run return 0

# Save remaining ticks to paused storage and clear the live cooldown
$execute store result storage macro:engine paused_cooldowns.$(player).$(key) int 1 run scoreboard players get $cdp_exp macro.tmp
$data remove storage macro:engine cooldowns.$(player).$(key)
execute store result storage macro:output result int 1 run scoreboard players get $cdp_exp macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cooldown/pause ","color":"aqua"},{"text":"⏸ ","color":"yellow"},{"text":"$(player)","color":"white"},{"text":":","color":"#555555"},{"text":"$(key)","color":"aqua"},{"text":" → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"},{"text":"t remaining","color":"#555555"}]
