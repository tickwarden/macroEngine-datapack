# ============================================
# ame_load:load/storages
# ============================================
# Performs all storage and counter initializations.
# "execute unless" protected with — existing data is not overwritten.
# ============================================

# ─── Epoch counteri ────────────────────────────────────────
# BUG FIX v3.0: $epoch macro.time is NOT reset on /reload.
# Only if it has never existed (ilk loadde) is reset;
# so cooldowns surviand server restarts.
execute unless score $epoch macro.time matches -2147483648..2147483647 run scoreboard players set $epoch macro.time 0
scoreboard players set $tick macro.tmp 0

# ─── process_queue ozyineleme depth counteri ─────────────
# BUG FIX v3.0: Reset at start of each tick; 256 limit
# prevents stack overflow within the same tick.
scoreboard players set $pq_depth macro.tmp 0

# ─── Auto-HUD modulo sabiti ───────────────────────────────
# $pb_four = 1 → update every tick (continuous actionbar)
scoreboard players set $pb_four macro.tmp 1

# ─── Throttle storage ────────────────────────────────────
execute unless data storage macro:engine throttle run data modify storage macro:engine throttle set value {}

# ─── Flag / State storage ────────────────────────────────
execute unless data storage macro:engine flags run data modify storage macro:engine flags set value {}
execute unless data storage macro:engine states run data modify storage macro:engine states set value {}

# ─── İzin storage ────────────────────────────────────────
execute unless data storage macro:engine permissions run data modify storage macro:engine permissions set value {}

# ─── perm/trigger storage ─────────────────────────────────
execute unless data storage macro:engine perm_triggers run data modify storage macro:engine perm_triggers set value {}
execute unless data storage macro:engine perm_trigger_names run data modify storage macro:engine perm_trigger_names set value []

# ─── Trigger bind listesi ────────────────────────────────
execute unless data storage macro:engine trigger_binds run data modify storage macro:engine trigger_binds set value []
