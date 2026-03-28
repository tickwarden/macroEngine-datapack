# macro:hook/internal/exec [MACRO]
# INPUT: $(event), $(func) veya $(cmd)
# @s = tetikleyen oyuncu
#
# with storage macro:engine _hook_ctx — nested path yok, flat compound.
# If func exists, run function; otherwise run cmd.

$execute if data storage macro:engine _hook_ctx{func:"$(func)"} run function $(func)
$execute unless data storage macro:engine _hook_ctx{func:"$(func)"} run function macro:hook/internal/run_cmd with storage macro:engine _hook_ctx
