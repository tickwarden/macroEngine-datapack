# ─────────────────────────────────────────────────────────────────
#  macro:dialog/show  [1.21.6+ overlay]
#  Shows the dialog stored at macro:engine dialog.DIALOG as inline JSON.
#  Called by dialog/open after validation.
#  Uses show_macro_exec to pipe DIALOG compound as inline dialog.
# ─────────────────────────────────────────────────────────────────

execute if entity @s[tag=macro.dialog_opened] at @s run return 0
execute unless data storage macro:engine dialog.DIALOG run return 0

execute at @s run function macro:player/get_name
data modify storage macro:engine dialog.NAME set from storage macro:names temp.NAME

function macro:dialog/internal/show_dialog_exec with storage macro:engine dialog

tag @s add macro.dialog_opened

return 1
