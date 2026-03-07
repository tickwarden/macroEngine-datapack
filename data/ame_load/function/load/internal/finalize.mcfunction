# ============================================
# ame_load:load/internal/finalize
# ============================================
# Post-load integrity report. Called as the
# final step of all.mcfunction, after:
# • global.loaded = 1b is set
# • version scores are written (version_set)
#
# Responsibilities:
# • test_block log (success slot Z=1601)
# • Admin tellraw: version + score summary
# • AME log buffer: final INFO entry
# ============================================

# ─── Test framework log block ─────────────────────────────
# BUG FIX v1.0.6-pre2: Base used `~ ~101/~100 ~` relative coords + unnecessary
# redstone_block pattern. Fixed to use absolute coords matching the overlay versions.
# Z=1601 : success slot (Z=1600 = version conflict, see version_warn)
setblock -30000000 0 1601 minecraft:test_block[mode=log]{mode:"log",message:"✅ [AME] v1.0.6-pre3 loaded successfully."}
setblock -30000000 1 1601 minecraft:redstone_block

# ─── Admin summary (macro.debug tag) ─────────────────────
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"aqua","bold":true},{"text":"v1.0.6-pre3 ","color":"green","bold":true},{"text":"ready · ame.pre_version → ","color":"dark_gray"},{"score":{"name":"#ame.major","objective":"ame.pre_version"},"color":"yellow"},{"text":".","color":"dark_gray"},{"score":{"name":"#ame.minor","objective":"ame.pre_version"},"color":"yellow"},{"text":".","color":"dark_gray"},{"score":{"name":"#ame.patch","objective":"ame.pre_version"},"color":"yellow"}]

# ─── AME log buffer (INFO) ────────────────────────────────
data modify storage macro:input message set value "✅ All modules initialized. Engine ready."
data modify storage macro:input level set value "AME"
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}
data remove storage macro:input message
data remove storage macro:input level
data remove storage macro:input color

setblock -30000000 0 1601 minecraft:air
setblock -30000000 0 1601 minecraft:air
