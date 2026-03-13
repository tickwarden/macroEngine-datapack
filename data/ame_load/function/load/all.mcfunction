# ============================================
# ame_load:load/all
# ============================================
# Modular load orchestration.
# Called by macro:load.
#
# Flow:
# validate → scoreboards → storages → other → finalize
#
# If validate returns 0, the entire load is cancelled.
# ============================================

forceload add -30000000 1600

# ─── 1. Validation ────────────────────────────────────────
# Guard + storage/version/scoreboard checks; return 0 cancels load
execute unless function ame_load:load/internal/validate run return 0

# ─── 2. Startup log ───────────────────────────────────
data modify storage macro:input level set value "A.M.E."
data modify storage macro:input message set value "Starting..."
data modify storage macro:input color set value "aqua"
function macro:log/add with storage macro:input {}

# ─── 3. Scoreboard objectives ────────────────────────────
function ame_load:load/scoreboards

# ─── 4. Storage + counter init ─────────────────────────
function ame_load:load/storages

# ─── 5. Schedule / forceload / trigger ───────────────────
function ame_load:load/other

# ─── 6. Loaded flag ─────────────────────────────────
data modify storage macro:engine global.loaded set value 1b

# ─── 6.5 Version scores ──────────────────────────────────
# Writes #ame.major=2 #ame.minor=0 #ame.patch=3 #ame.pre=2 #ame.ver_set=1
# to ame.pre_version. On next reload, validate compares these.
function ame_load:load/internal/version_set

# ─── 7. Loaded notification ───────────────────────────────
tellraw @a[tag=macro.debug] {"text":"[Macro Engine v2.0.3-pre2] Loaded.","color":"green"}
# BUG FIX v3.5: pitch:0 → pitch:1 corrected
data modify storage macro:input sound set value "minecraft:ui.toast.challenge_complete"
data modify storage macro:input volume set value 1
data modify storage macro:input pitch set value 1
function macro:cmd/sound_all with storage macro:input {}
data remove storage macro:input sound
data remove storage macro:input volume
data remove storage macro:input pitch

# ─── 8. Final log ────────────────────────────────────────
# BUG FIX v1.0.4: Duplicate init block and unconditional log_count reset removed.
data modify storage macro:input level set value "Advanced Macro Engine v2.0.3-pre2"
data modify storage macro:input message set value "Loaded."
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}

# ─── 9. Post-load integrity report ───────────────────────
# test_block success log (Z=1601) + admin score summary
function ame_load:load/internal/finalize
