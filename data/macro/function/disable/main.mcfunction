# ============================================
# macro:disable/main — Tam durum temizleme
# ============================================
# BUG FIX v3.1: queue, events, cooldowns, player vars,
# schedules, throttle, _input_stack, _event_tmp,
# _repeat ve rng_state artık temizleniyor.
# ============================================

# ─── Schedule'ları durdur ────────────────────────────────
schedule clear macro:lib/sync_tick

# ─── Trigger sıfırlama ───────────────────────────────────
scoreboard players reset @a macro_menu
scoreboard players reset @a macro_run

# ─── Sayaçları sıfırla ───────────────────────────────────
scoreboard players reset $tick macro.tmp
scoreboard players reset $pq_depth macro.tmp
scoreboard players reset $epoch macro.time

# ─── Storage temizle (tam) ───────────────────────────────
# Kuyruk
data remove storage macro:engine queue
# Olaylar
data remove storage macro:engine events
data remove storage macro:engine event_context
data remove storage macro:engine _event_tmp
# Cooldown + Throttle
data remove storage macro:engine cooldowns
data remove storage macro:engine throttle
# Oyuncu verileri
data remove storage macro:engine players
# BUG FIX v1.0.4: flags ve states load.mcfunction'da başlatılıyor ama
# disable'da temizlenmiyordu → yeniden yüklemeden sonra kalıntı veriler kalıyordu.
data remove storage macro:engine flags
data remove storage macro:engine states
# Schedule kayıtları
data remove storage macro:engine schedules
# Input stack + tekrar sayacı
data remove storage macro:engine _input_stack
data remove storage macro:engine _repeat
# Math geçici
data remove storage macro:engine _rng_state
data remove storage macro:engine _felist_input
data remove storage macro:engine _felist_state
data remove storage macro:engine _felist_current
data remove storage macro:engine _felist_i
# Log sistemi
data remove storage macro:engine log_display
scoreboard players reset $log_count macro.tmp
# Trigger sistemi
data remove storage macro:engine trigger_binds
data remove storage macro:engine _tc_binds
data remove storage macro:engine _tc_current
data remove storage macro:engine _tc_unbind
data remove storage macro:engine _tc_uval
# Config korunur — yeniden yükleme sonrası kaybolmasın
# Genel global bayrağı kaldır
data remove storage macro:engine global
data remove storage macro:output result

# ─── Scoreboard objectives kaldır ───────────────────────
scoreboard objectives remove macro.tmp
scoreboard objectives remove macro.time
scoreboard objectives remove macro_menu
scoreboard objectives remove macro_run
scoreboard objectives remove macro_action
scoreboard objectives remove macro.tick_guard
# BUG FIX v1.0.1: macro.dialog_load objective silinmiyordu.
scoreboard objectives remove macro.dialog_load

# BUG FIX v1.0.1: Dialog tag'leri temizle (disable sonrası kalıntı kalmasın)
tag @a remove macro.dialog_opened
tag @a remove macro.dialog_closed
