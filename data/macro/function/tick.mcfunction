# ============================================
# macro:tick — Her tick çalışır
# ============================================
# - $epoch macro.time: mutlak tick sayacı (cooldown için)
# - $tick macro.tmp: sync_tick'e kadar geçen tick (1sn'de bir sıfırlanır)
# - Queue işlenir
# - '/trigger macro_menu' çalışır
# - '/trigger macro_run' çalışır
# - '/trigger macro_action' → trigger/bind sistemi ile dispatch
# - Auto-HUD: macro:engine pb_obj ayarlıysa progress_bar_self her tick otomatik çalışır
# Aktif et : data modify storage macro:engine pb_obj set value "health"
# data modify storage macro:engine pb_max set value 20
# data modify storage macro:engine pb_label set value "Can"
# Kapat : data remove storage macro:engine pb_obj
# ============================================

execute unless entity @a run return 0

execute unless data storage macro:engine global{loaded:1b} run return 0

scoreboard players add $epoch macro.time 1
scoreboard players add $tick macro.tmp 1
# BUG FIX v3.0: Her tick'te özyineleme sayacını sıfırla
scoreboard players set $pq_depth macro.tmp 0
function macro:lib/process_queue
execute as @a[scores={macro_menu=1..}] run function macro:menu
scoreboard players set @a[scores={macro_menu=1..}] macro_menu 0
scoreboard players enable @a[scores={macro_menu=-1..}] macro_menu

execute as @a[scores={macro_run=1..}] run function #macro:run
scoreboard players set @a[scores={macro_run=1..}] macro_run 0
scoreboard players enable @a[scores={macro_run=-1..}] macro_run

# ── Gelişmiş trigger dispatch (v1.0.3) ───────────────────────────
# macro_action > 0 olan oyuncu için trigger/bind listesi taranır.
# Eşleşen tüm bind'ların fonksiyonları @s olarak çalıştırılır.
# macro:input'e kesinlikle dokunulmaz (tick context güvenliği).
execute as @a[scores={macro_action=1..}] run function macro:trigger/internal/dispatch

# ── Auto-HUD: her tick, pb_obj varsa progress_bar_self çalıştır ──
# $epoch % 1 = her zaman 0, yani sürekli çalışır — actionbar asla kaybolmaz
execute if data storage macro:engine pb_obj run scoreboard players operation $pb_mod macro.tmp = $epoch macro.time
execute if data storage macro:engine pb_obj run scoreboard players operation $pb_mod macro.tmp %= $pb_four macro.tmp
execute if data storage macro:engine pb_obj run execute if score $pb_mod macro.tmp matches 0 run execute as @a run function macro:string/progress_bar_self with storage macro:engine {}

# BUG FIX v1.0.1: Yalnızca pozitif skorları azalt.
# Önceden "@a" tüm oyuncuların skorunu azaltıyordu; skor 0'ı geçip -1, -2...
# olduğunda "=0" koşulu bir daha eşleşmiyordu (race condition).
# Artık skor 0'ın altına düşmez; tetikleyici her zaman çalışır.
scoreboard players remove @a[scores={macro.dialog_load=1..}] macro.dialog_load 1

# Süre doldu + loading dialog kapatıldıysa aç (macro:dialog/load ile kullanım)
execute as @a[scores={macro.dialog_load=0},tag=macro.dialog_closed] at @s run function macro:dialog/open
# BUG FIX v1.0.1: Doğrudan "/scoreboard players set @s macro.dialog_load N" kullanımı:
# Tag hiç eklenmeden sadece skor ayarlandıysa da dialog açılsın.
execute as @a[scores={macro.dialog_load=0},tag=!macro.dialog_closed,tag=!macro.dialog_opened] at @s run function macro:dialog/open

# Diğer
tag @a[tag=macro.admin] add macro.debug
scoreboard players enable @a[tag=macro.admin] macro_menu
scoreboard players enable @a[tag=macro.admin] macro_action
scoreboard players enable @a[tag=macro.admin] macro_run
