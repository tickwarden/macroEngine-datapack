# ─────────────────────────────────────────────────────────────────
#  macro:dialog/is_open
#  Checks whether the executing player currently has a dialog open.
#  Output: macro:output result → 1b (open) or 0b (closed / not set)
#
#  Example:
#    execute as @a run function macro:dialog/is_open
#    # Then read macro:output result per player context
# ─────────────────────────────────────────────────────────────────

data modify storage macro:output result set value 0b
execute if entity @s[tag=macro.dialog_opened] unless entity @s[tag=macro.dialog_closed] run data modify storage macro:output result set value 1b

tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"dialog/is_open ","color":"aqua"},{"text":"→ ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]
