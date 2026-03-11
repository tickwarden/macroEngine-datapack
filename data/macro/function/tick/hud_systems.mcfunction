# ============================================
# macro:tick/hud_systems — Otomatik HUD Sistemleri
# ============================================
# Flag: #m_hud macro.Flags
# - Auto-HUD: eğer macro:engine pb_obj ayarlıysa, progress_bar_self otomatik her tick'te çalışır
# Enable : data modify storage macro:engine pb_obj set value "health"
# data modify storage macro:engine pb_max set value 20
# data modify storage macro:engine pb_label set value "Health"
# Disable : data remove storage macro:engine pb_obj
# ============================================

# Auto-HUD: every tick, run progress_bar_self if pb_obj is set
# $epoch % 1 = always 0, so it runs every tick — actionbar never disappears
execute if data storage macro:engine pb_obj run scoreboard players operation $pb_mod macro.tmp = $epoch macro.time
execute if data storage macro:engine pb_obj run scoreboard players operation $pb_mod macro.tmp %= $pb_four macro.tmp
execute if data storage macro:engine pb_obj run execute if score $pb_mod macro.tmp matches 0 run execute as @a run function macro:string/progress_bar_self with storage macro:engine {}
