# ============================================
# macro:player/internal/assign_pid
# ============================================
# Assigns a unique integer PID to a player and
# stores the name → pid mapping in storage.
#
# Called ONLY from macro:player/init when the
# player does not yet have an entry in player_pids.
#
# BUG FIX v2.0.3-pre2: Introduced to replace @a[name=...]
# selectors in perm/* with unambiguous pid-based
# targeting (duplicate-name safe for offline servers).
#
# NOTE: Uses @a[name=$(player),limit=1] here — this is
# the ONE intentional remaining name-selector, executed
# exactly once per player lifetime during their very first
# init. The window for a collision (two unknown players
# with identical names joining simultaneously before
# either gets a pid) is negligible in practice.
#
# INPUT: macro:input { player:"<n>" }
# SIDE EFFECTS:
#   macro:engine player_pids.$(player) → new pid (int)
#   @a[name=$(player),limit=1] macro.pid score → new pid
#   macro:engine _pid_seq → incremented
# ============================================

# Read current sequence counter into tmp
execute store result score $next_pid macro.tmp run data get storage macro:engine _pid_seq

# Increment counter (new pid = old _pid_seq + 1)
scoreboard players add $next_pid macro.tmp 1

# Write pid to storage map and to the player's scoreboard score
$execute store result storage macro:engine player_pids.$(player) int 1 run scoreboard players get $next_pid macro.tmp
$scoreboard players operation @a[name=$(player),limit=1] macro.pid = $next_pid macro.tmp

# Persist incremented sequence back to storage (survives /reload)
execute store result storage macro:engine _pid_seq int 1 run scoreboard players get $next_pid macro.tmp

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/internal/assign_pid ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → pid=","color":"#555555"},{"score":{"name":"$next_pid","objective":"macro.tmp"},"color":"green"}]
