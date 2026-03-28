# ─────────────────────────────────────────────────────────────────
# macro:wand/register_cmd
# Binds a command to the wand (raw command instead of func).
#
# INPUT:
#   $(tag) → custom_data tag name
#   $(cmd) → raw command to run
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine wand_binds run data modify storage macro:engine wand_binds set value []

$data modify storage macro:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/register_cmd ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"},{"text":" → cmd","color":"#555555"}]
