# ============================================
# macro:load — Advanced Macro Engine v1.0.3
# ============================================
# /reload veya sunucu başlangıcında otomatik çalışır.
# Scoreboard, storage ve schedule başlatır.
#
# v1.0.3 değişiklikleri:
# + log/ modülü: dialog tabanlı log sistemi (log/add, info, warn, error, debug, show, clear)
# + lib/tick_guard: entity başına tick-safe guard (çift tetiklenmeyi engeller)
# + lib/tick_guard_clear: guard manuel sıfırlama
# + trigger/ modülü: macro_action trigger + value→function bind sistemi
# (trigger/bind, unbind, unbind_all, enable, disable, list + iç dispatch)
# + macro.tick_guard scoreboard objective eklendi
# + macro_action trigger objective eklendi
# + macro:engine log_display ve trigger_binds storage başlatma eklendi
# ============================================

# ─── Log storage başlat (önce, log/add çağrılmadan) ─────
# BUG FIX v1.0.4: execute unless sadece bir önceki satıra uygulanır;
# scoreboard set satırı koşulsuz çalışıyordu → circular buffer bozuluyordu.
# Artık her iki satır da unless ile korunuyor ve yalnızca bir kez çalışıyor.
execute unless data storage macro:engine log_display run data modify storage macro:engine log_display set value []
execute unless score $log_count macro.tmp matches 0.. run scoreboard players set $log_count macro.tmp 0

# ─── Load-once guard ÖNCE kontrol et (log kirliliğini önler) ─────────────
# BUG FIX v1.0.4: Guard log eklemeden önce gelmeliydi.
# Önceki sırada zaten yüklüyse "Başlatılıyor..." logu eklenip sonra return 0
# yapılıyordu — gereksiz log entry'si birikiyordu.
execute if data storage macro:engine global{loaded:1b} run data modify storage macro:input message set value "Zaten yüklü — tekrar yükleme atlandı."
execute if data storage macro:engine global{loaded:1b} run function macro:log/warn with storage macro:input {}
execute if data storage macro:engine global{loaded:1b} run return 0

# Başlangıç logu (guard geçildikten sonra — ilk yüklemede)
data modify storage macro:input level set value "A.M.E."
data modify storage macro:input message set value "Başlatılıyor..."
data modify storage macro:input color set value "aqua"
function macro:log/add with storage macro:input {}

# ─── Scoreboard Objectives ───────────────────────────────
scoreboard objectives add macro.tmp dummy
scoreboard objectives add macro.time dummy
scoreboard objectives add macro_menu trigger
scoreboard objectives add macro_run trigger
scoreboard objectives add macro_action trigger
scoreboard objectives add macro.dialog_load dummy
# Tick-safe guard: her entity'nin son işlendiği epoch değerini tutar
scoreboard objectives add macro.tick_guard dummy
# Health objective: Progress bar için gerekli
scoreboard objectives add health health {"text":"❤","color":"red"}

# ─── Sayaçları başlat ────────────────────────────────────
# Auto-HUD modulo sabiti (1 = her tick, sürekli güncelleme)
scoreboard players set $pb_four macro.tmp 1
# BUG FIX v3.0: $epoch macro.time /reload'da SIFIRLANMAZ.
# Yalnızca hiç var olmamışsa (ilk yüklemede) sıfırlanır;
# böylece cooldown'lar sunucu yeniden başlatmadan korunur.
execute unless score $epoch macro.time matches -2147483648..2147483647 run scoreboard players set $epoch macro.time 0
scoreboard players set $tick macro.tmp 0

# ─── process_queue özyineleme derinlik sayacı ─────────────
# BUG FIX v3.0: Her tick başında sıfırlanır; 256 limiti
# aynı tick'te stack overflow'u engeller.
scoreboard players set $pq_depth macro.tmp 0

# ─── Global storage başlat ───────────────────────────────
data modify storage macro:engine global set value {version:"V1.0.4"}

# ─── Throttle durumunu başlat (yoksa) ────────────────────
execute unless data storage macro:engine throttle run data modify storage macro:engine throttle set value {}

# ─── Flag/State storage başlat (yoksa) ───────────────────
execute unless data storage macro:engine flags run data modify storage macro:engine flags set value {}
execute unless data storage macro:engine states run data modify storage macro:engine states set value {}

# ─── Log storage (ilk blokta zaten başlatıldı — bu blok kaldırıldı) ──────

# ─── Trigger bind listesini başlat (yoksa) ───────────────
execute unless data storage macro:engine trigger_binds run data modify storage macro:engine trigger_binds set value []

# ─── sync_tick schedule'ı kur (her 20 tick = 1sn) ───────
data modify storage macro:input func set value "macro:lib/sync_tick"
data modify storage macro:input interval set value 20
data modify storage macro:input key set value "sync_tick"
function macro:lib/schedule with storage macro:input {}
data remove storage macro:input func
data remove storage macro:input interval
data remove storage macro:input key

# Trigger'lar
scoreboard players enable @a[tag=macro.admin] macro_menu
scoreboard players enable @a[tag=macro.admin] macro_run
scoreboard players enable @a[tag=macro.admin] macro_action

# Storage ayarla
data modify storage macro:engine global.loaded set value 1b

# ─── Yükleme mesajı ──────────────────────────────────────
tellraw @a[tag=macro.debug] {"text":"[Macro Engine v1.0.3] Yüklendi.","color":"green"}
# BUG FIX v3.5: Makro fonksiyonu "function <name> {nbt}" sözdizimi ile
# çağrılamaz — "with storage" kullanılmak zorundadır.
# Ayrıca pitch:0 (duyulamaz ses) → pitch:1 (normal perde) düzeltildi.
data modify storage macro:input sound set value "minecraft:ui.toast.challenge_complete"
data modify storage macro:input volume set value 1
data modify storage macro:input pitch set value 1
function macro:cmd/sound_all with storage macro:input {}
data remove storage macro:input sound
data remove storage macro:input volume
data remove storage macro:input pitch

# ─── Final log ───────────────────────────────────────────
# BUG FIX v1.0.4: Sonundaki duplicate init bloğu ve koşulsuz $log_count sıfırlaması kaldırıldı.
# "execute if loaded run return 1" de kaldırıldı (her zaman true, gereksiz).
data modify storage macro:input level set value "Advanced Macro Engine v1.0.3"
data modify storage macro:input message set value "Yüklendi."
data modify storage macro:input color set value "green"
function macro:log/add with storage macro:input {}