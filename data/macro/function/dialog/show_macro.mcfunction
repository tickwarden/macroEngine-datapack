# ─────────────────────────────────────────────────────────────────
#  macro:dialog/show_macro
#  Shows a dialog from inline JSON stored in macro:engine dialog.DATA.
#  Requires Minecraft 1.21.6+ (pack_format 80+).
#  On older versions this stub fires a friendly error message.
#
#  Usage (1.21.6+ overlay handles actual logic):
#    data modify storage macro:engine dialog.DATA set value '{...}'
#    function macro:dialog/show_macro
# ─────────────────────────────────────────────────────────────────

tellraw @s {"text":"This feature requires Minecraft 1.21.6 or higher!","color":"red","italic":false}
