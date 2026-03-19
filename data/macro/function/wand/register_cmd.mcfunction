# ─────────────────────────────────────────────────────────────────
# macro:wand/register_cmd
# Wand'a komut bağlar (func yerine ham komut).
#
# INPUT:
#   $(tag) → custom_data tag adı
#   $(cmd) → çalışacak ham komut
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine wand_binds run data modify storage macro:engine wand_binds set value []

$data modify storage macro:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/register_cmd ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"},{"text":" → cmd","color":"#555555"}]
