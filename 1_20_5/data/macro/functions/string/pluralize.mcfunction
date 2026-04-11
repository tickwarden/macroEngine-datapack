# ─────────────────────────────────────────────────────────────────
# macro:string/pluralize
# Stores the singular or plural form of a word based on count.
# Simple English rule: count == 1 → singular, else → plural.
#
# INPUT : $(count)    → integer count
#         $(singular) → singular form (e.g. "item")
#         $(plural)   → plural form   (e.g. "items")
# OUTPUT: macro:output result → chosen string
# macro:output count → original count
#
# EXAMPLE:
# function macro:string/pluralize {count:3,singular:"apple",plural:"apples"}
# → macro:output result = "apples"
# ─────────────────────────────────────────────────────────────────

$scoreboard players set #plr_c macro.tmp $(count)
execute store result storage macro:output count int 1 run scoreboard players get #plr_c macro.tmp

$data modify storage macro:engine _plr_singular set value $(singular)
$data modify storage macro:engine _plr_plural set value $(plural)

data modify storage macro:output result set from storage macro:engine _plr_plural
execute if score #plr_c macro.tmp matches 1 run data modify storage macro:output result set from storage macro:engine _plr_singular

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/pluralize ","color":"aqua"},{"text":"count=$(count) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]
