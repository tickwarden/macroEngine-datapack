# ============================================
# ame_load:load/scoreboards
# ============================================
# Creates all scoreboard objectives.
# If already present, "objectives add" silently fails — guvenli.
# ============================================

scoreboard objectives add macro.tmp dummy
scoreboard objectives add macro.time dummy
scoreboard objectives add macro_menu trigger
scoreboard objectives add macro_run trigger
scoreboard objectives add macro_action trigger
scoreboard objectives add macro.dialog_load dummy
# Tick-safe guard: entity basina son islenen epoch valueini tutar
scoreboard objectives add macro.tick_guard dummy
# Health objective: required for progress_bar_self (Auto-HUD)
scoreboard objectives add health health {"text":"❤","color":"red"}
# Version tracking: $v_major/$v_minor/$v_patch + sentinel $ame_ver_set
# See: ame_load:load/internal/version_set (writer)
# ame_load:load/internal/validate (reader / conflict check)
scoreboard objectives add ame.pre_version dummy
# Unique player ID — assigned once per player on first init; used for unambiguous
# entity targeting instead of @a[name=...] (duplicate-name safe).
scoreboard objectives add macro.pid dummy

# ============================================
# Flag Sistemi - Tick Kategorilerini Kontrol Eder
# ============================================
scoreboard objectives add macro.Flags dummy {"text":"Macro Flags","color":"gold"}

# Flag başlangıç değerleri (1 = aktif, 0 = devre dışı)
scoreboard players set #m_time macro.Flags 1
scoreboard players set #m_queue macro.Flags 1
scoreboard players set #m_player macro.Flags 1
scoreboard players set #m_hud macro.Flags 1
scoreboard players set #m_admin macro.Flags 1
