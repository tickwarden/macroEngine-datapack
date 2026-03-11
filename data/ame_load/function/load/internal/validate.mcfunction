# ============================================
# ame_load:load/internal/validate
# ============================================
# Pre-load prerequisite validation.
# Returns 0 if load should be aborted, 1 on success.
#
# Checks (in order):
# 1) Global storage absent → create it
# 2) Log storage absent → create it (before log/add is called)
# 3) Already-loaded guard (return 0)
# 4) Storage version match check (return 0)
# 5) Scoreboard version conflict check (return 0)
# ============================================

# ─── Global storage init ───────────────────────────────
execute unless data storage macro:engine global run data modify storage macro:engine global set value {version:"v2.0.2"}

# ─── Log storage init (before log/add is called) ─────
# BUG FIX v1.0.4: Both lines are protected with unless;
# circular buffer corruption prevented.
execute unless data storage macro:engine log_display run data modify storage macro:engine log_display set value []
execute unless score #ame.log_count macro.tmp matches 0.. run scoreboard players set #ame.log_count macro.tmp 0

# ─── Already-loaded guard ────────────────────────────────
# BUG FIX v1.0.4: Guard must come before log entries.
execute if data storage macro:engine global{loaded:1b} run data modify storage macro:input message set value "Already loaded — skipping reload."
execute if data storage macro:engine global{loaded:1b} run function macro:log/warn with storage macro:input {}
execute if data storage macro:engine global{loaded:1b} run return 0

# ─── Storage version check ───────────────────────────────
# BUG FIX v2.0.0: Fallback message was stale "V1.0.6-pre4". Now reflects actual version.
execute unless data storage macro:engine global{version:"v2.0.2"} run data modify storage macro:names temp.vers set value "V2.0.2"
execute unless data storage macro:engine global{version:"v2.0.2"} run tellraw @a [{"text":"[AME] ","color":"aqua","bold":true},{"text":"Version mismatch — expected ","color":"red"},{"storage":"macro:names","nbt":"temp.vers","color":"yellow"},{"text":".","color":"red"}]
execute unless data storage macro:engine global{version:"v2.0.2"} run return 0

# ─── Scoreboard version conflict check ───────────────────
# ame.pre_version objective: created here early (safe if already exists).
# #ame.ver_set = 1 means a previous AME session wrote version scores.
# BUG FIX v2.0.0: Comment and comparisons were stale from v1.0.6-pre4 (major=1, patch=6, pre=4).
# Any mismatch from (major=2, minor=0, patch=0, pre=0) triggers version_warn and aborts load.
scoreboard objectives add ame.pre_version dummy
scoreboard players set #ame.mismatch ame.pre_version 0
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.major ame.pre_version matches 2 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.minor ame.pre_version matches 0 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.patch ame.pre_version matches 2 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.ver_set ame.pre_version matches 1 run execute unless score #ame.pre ame.pre_version matches 0 run scoreboard players set #ame.mismatch ame.pre_version 1
execute if score #ame.mismatch ame.pre_version matches 1 run function ame_load:load/internal/version_warn
execute if score #ame.mismatch ame.pre_version matches 1 run return 0

return 1
