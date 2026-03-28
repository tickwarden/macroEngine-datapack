# macro:hook/internal/check_bind [MACRO]
# INPUT: $(event) — event field of the bind in _hook_ctx
# If it matches _hook_fire_event, run func or cmd.
# @s = tetikleyen oyuncu

$execute if data storage macro:engine {_hook_fire_event:"$(event)"} run function macro:hook/internal/exec with storage macro:engine _hook_ctx
