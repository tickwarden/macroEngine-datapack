# ============================================
# ame_load:load/internal/version_set
# ============================================
# Writes current AME version to the ame.pre_version
# scoreboard objective after a successful load.
# Called from all.mcfunction step 6.5.
#
# Scores written:
# #ame.major ame.pre_version → 2
# #ame.minor ame.pre_version → 0
# #ame.patch ame.pre_version → 3
# #ame.pre ame.pre_version → 2 (pre-release flag; 2 = pre2)
# #ame.ver_set ame.pre_version → 1 (sentinel)
#
# BUG FIX v1.0.6-pre2: Renamed $v_* fake players to #ame.* to avoid
# macro variable parser conflict in 1.21.1 (pack_format 48-57).
#
# Sentinel semantics:
# #ame.ver_set = 0 / unset → first run, no conflict check
# #ame.ver_set = 1 → AME was previously initialized;
# validate will compare scores
#
# ⚠ VERSION SYNC CHECKLIST — sürüm güncellenirken her ikisi de değişmeli:
# 1) Aşağıdaki score değerleri (major/minor/patch/pre)
# 2) validate.mcfunction satırlarındaki hard-coded string → "v{major}.{minor}.{patch}-pre{N}"
#    (örn: global{version:"v2.0.3-pre3"} ve tellraw mesajındaki "V2.0.3-pre2")
# Birini atlarsam scoreboard↔storage mismatch → her reload'da version_warn atar.
# ============================================

# major=2  minor=0  patch=3  pre=2  → v2.0.3-pre3
scoreboard players set #ame.major ame.pre_version 2
scoreboard players set #ame.minor ame.pre_version 0
scoreboard players set #ame.patch ame.pre_version 3
scoreboard players set #ame.pre ame.pre_version 3
scoreboard players set #ame.ver_set ame.pre_version 1
