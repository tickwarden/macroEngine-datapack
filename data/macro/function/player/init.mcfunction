# ============================================
# macro:player/init
# ============================================
# Called when a player first joins or on reset.
# INPUT: macro:input { player:"<playerName>" }
# ============================================

$execute unless data storage macro:engine players.$(player) run data modify storage macro:engine players.$(player) set value {}
$execute unless data storage macro:engine players.$(player).coins run data modify storage macro:engine players.$(player).coins set value 0
$execute unless data storage macro:engine players.$(player).level run data modify storage macro:engine players.$(player).level set value 1
$execute unless data storage macro:engine players.$(player).xp run data modify storage macro:engine players.$(player).xp set value 0
$data modify storage macro:engine players.$(player).online set value 1b
$execute unless data storage macro:engine players.$(player).first_join_tick run execute store result storage macro:engine players.$(player).first_join_tick int 1 run scoreboard players get $epoch macro.time
$execute store result storage macro:engine players.$(player).last_join_tick int 1 run scoreboard players get $epoch macro.time

# ─── PID assignment (BUG FIX v2.0.2) ────────────────────────────────────────
# Runs once per player lifetime — skipped on every subsequent call.
$execute unless data storage macro:engine player_pids.$(player) run function macro:player/internal/assign_pid with storage macro:input {}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/init ","color":"aqua"},{"text":"$(player)","color":"white"}]
