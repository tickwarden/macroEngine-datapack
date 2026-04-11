# macro:string/repeat
# Repeats a single character (char) exactly `count` times (1–16).
# Params: char (single character), count (integer 1–16)
# Output: macro:output result = repeated string
# Note: count is clamped to 1–16. Larger repeats should be assembled by the caller.
#
# Implementation: static dispatch to internal/repeat_N which sets the literal string.
# Each internal file uses a single $data modify line with N $(char) expansions.

data modify storage macro:output result set value ""

$scoreboard players set $sr_n macro.tmp $(count)
execute if score $sr_n macro.tmp matches ..0 run scoreboard players set $sr_n macro.tmp 1
execute if score $sr_n macro.tmp matches 17.. run scoreboard players set $sr_n macro.tmp 16

execute if score $sr_n macro.tmp matches 1 run function macro:string/internal/repeat_1 with storage macro:input {}
execute if score $sr_n macro.tmp matches 2 run function macro:string/internal/repeat_2 with storage macro:input {}
execute if score $sr_n macro.tmp matches 3 run function macro:string/internal/repeat_3 with storage macro:input {}
execute if score $sr_n macro.tmp matches 4 run function macro:string/internal/repeat_4 with storage macro:input {}
execute if score $sr_n macro.tmp matches 5 run function macro:string/internal/repeat_5 with storage macro:input {}
execute if score $sr_n macro.tmp matches 6 run function macro:string/internal/repeat_6 with storage macro:input {}
execute if score $sr_n macro.tmp matches 7 run function macro:string/internal/repeat_7 with storage macro:input {}
execute if score $sr_n macro.tmp matches 8 run function macro:string/internal/repeat_8 with storage macro:input {}
execute if score $sr_n macro.tmp matches 9 run function macro:string/internal/repeat_9 with storage macro:input {}
execute if score $sr_n macro.tmp matches 10 run function macro:string/internal/repeat_10 with storage macro:input {}
execute if score $sr_n macro.tmp matches 11 run function macro:string/internal/repeat_11 with storage macro:input {}
execute if score $sr_n macro.tmp matches 12 run function macro:string/internal/repeat_12 with storage macro:input {}
execute if score $sr_n macro.tmp matches 13 run function macro:string/internal/repeat_13 with storage macro:input {}
execute if score $sr_n macro.tmp matches 14 run function macro:string/internal/repeat_14 with storage macro:input {}
execute if score $sr_n macro.tmp matches 15 run function macro:string/internal/repeat_15 with storage macro:input {}
execute if score $sr_n macro.tmp matches 16 run function macro:string/internal/repeat_16 with storage macro:input {}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/repeat ","color":"aqua"},{"text":"'$(char)'","color":"yellow"},{"text":" × $(count) → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"white"}]
