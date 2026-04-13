# ame_load:load/storages
# Initializes macro:engine storage fields that do not yet exist.
#
# SAFETY DESIGN
# -------------
# EVERY write here uses 'execute unless data storage ...' guards.
# This means:
#   - Fields that already exist from a prior session are NOT overwritten.
#   - Only fields missing from storage are initialized.
#   - Nondeterministic overwrite behaviour is impossible in this file.
#
# Fields that are INTENTIONALLY cleared on each reload are listed with
# explicit comments explaining why.
#
# SCOREBOARD SAFETY
# -----------------
# Epoch is preserved across reloads — cooldown expiry times depend on it.
# Tick counter is reset (irrelevant across reloads — just a monotonic counter).
# pq_depth is reset (queue state cannot survive reload safely).
#
# STORAGE VERSION GUARD
# ---------------------
# validate.mcfunction blocks a second load if global{loaded:1b} is set,
# so we only reach here when storage is either:
#   (a) fresh / never initialized, or
#   (b) was cleanly disabled via macro:disable (cleanup removed global).
# In both cases, initializing with 'unless data' guards is safe.

execute unless score $epoch macro.time matches -2147483648..2147483647 run scoreboard players set $epoch macro.time 0
scoreboard players set $tick macro.tmp 0

scoreboard players set $pq_depth macro.tmp 0

scoreboard players set $pb_four macro.tmp 1

execute unless data storage macro:engine throttle run data modify storage macro:engine throttle set value {}

execute unless data storage macro:engine flags run data modify storage macro:engine flags set value {}
execute unless data storage macro:engine states run data modify storage macro:engine states set value {}

execute unless data storage macro:engine permissions run data modify storage macro:engine permissions set value {}

execute unless data storage macro:engine perm_triggers run data modify storage macro:engine perm_triggers set value {}
execute unless data storage macro:engine perm_trigger_names run data modify storage macro:engine perm_trigger_names set value []

execute unless data storage macro:engine trigger_binds run data modify storage macro:engine trigger_binds set value []

execute unless data storage macro:engine interaction_binds run data modify storage macro:engine interaction_binds set value {attack:[], use:[]}

execute unless data storage macro:engine player_pids run data modify storage macro:engine player_pids set value {}
execute unless data storage macro:engine _pid_seq run data modify storage macro:engine _pid_seq set value 0

# UUID module init
function macro:uuid/internal/init

# once_per_player module init
execute unless data storage macro:engine once_per_player run data modify storage macro:engine once_per_player set value {}

# Wand module init
execute unless data storage macro:engine wand_binds run data modify storage macro:engine wand_binds set value []

# Hook module init
execute unless data storage macro:engine hook_binds run data modify storage macro:engine hook_binds set value []

# lib/fiber module init
execute unless data storage macro:engine fibers run data modify storage macro:engine fibers set value {}
# fibers._pending is always cleared — incomplete fibers from a prior tick
# cannot be safely resumed across a reload boundary
data remove storage macro:engine fibers._pending

# geo/region_watch module init
# Region watches are always cleared on reload — all packs must re-register
# their watches in the #macro:init function tag. This is intentional:
# region watch registrations are transient and pack-owned.
data remove storage macro:engine region_watches
data modify storage macro:engine region_watches set value []

# lib/batch module init
# Incomplete batches are always cleared on reload — they cannot be safely
# resumed across a reload boundary (executing context is gone).
data remove storage macro:engine batches
data modify storage macro:engine batches set value {}

# Wand cooldown module — separate storage (avoids collision with macro:cooldown)
execute unless data storage macro:engine wand_cooldowns run data modify storage macro:engine wand_cooldowns set value {}
