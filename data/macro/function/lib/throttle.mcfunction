# ============================================
# macro:lib/throttle
# ============================================
# Prevents a function from running more frequently than a given interval.
# Runs on first call; subsequent calls are dropped until the interval elapses
# (unlike debounce, which preserves the last call, not the first).
#
# INPUT: macro:input { func:"<namespace:path>", delay:<tick>, interval:<tick>, key:"<id>" }
# delay = queue delay before execution (0 = immediate)
# interval = minimum tick interval between allowed calls
# key = throttle identifier (must be unique per throttle point)
#
# OUTPUT: — (returns silently if throttled)
#
# EXAMPLE:
# data modify storage macro:input func set value "mypack:ui/update_hud"
# data modify storage macro:input delay set value 0
# data modify storage macro:input interval set value 20
# data modify storage macro:input key set value "hud_update"
# function macro:lib/throttle with storage macro:input {}
# # → HUD is updated at most once per second
# ============================================

# ─── Check the current throttle state ───────────────────────────────────────
scoreboard players set $thr_go macro.tmp 1

$execute if data storage macro:engine throttle.$(key) run execute store result score $thr_exp macro.tmp run data get storage macro:engine throttle.$(key)
execute store result score $thr_now macro.tmp run scoreboard players get $epoch macro.time
$execute if data storage macro:engine throttle.$(key) run execute if score $thr_now macro.tmp < $thr_exp macro.tmp run scoreboard players set $thr_go macro.tmp 0

# Throttled → bail out
execute if score $thr_go macro.tmp matches 0 run return 0

# Compute new expiry = now + interval
$scoreboard players set $thr_int macro.tmp $(interval)
scoreboard players operation $thr_now macro.tmp += $thr_int macro.tmp
$execute store result storage macro:engine throttle.$(key) int 1 run scoreboard players get $thr_now macro.tmp

# Enqueue the function
function macro:lib/queue_add with storage macro:input {}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"lib/throttle ","color":"aqua"},{"text":" → ","color":"dark_gray"},{"text":"$(key)","color":"aqua"}]
