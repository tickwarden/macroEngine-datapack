# ─────────────────────────────────────────────────────────────────
# macro:wand/register
# Registers a wand with a specific custom_data tag.
# On every item use, $(func) or $(cmd) runs.
#
# INPUT:
#   $(tag)  → custom_data tag name (e.g. "my_wand")
#   $(func) → (optional) function to run
#   $(cmd)  → (optional) command to run (if no func)
#
# OUTPUT: record added to macro:engine wand_binds list
#
# EXAMPLE:
#   data modify storage macro:input tag set value "fire_wand"
#   data modify storage macro:input func set value "mypack:on_fire_wand"
#   function macro:wand/register with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine wand_binds run data modify storage macro:engine wand_binds set value []

#$execute if data storage macro:input {func:"$(func)"} run data modify storage macro:engine wand_binds append value {tag:"$(tag)", func:"$(func)"}
#$execute unless data storage macro:input {func:"$(func)"} run data modify storage macro:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)"}

$data modify storage macro:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)",func:"$(func)"}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/register ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"}]
