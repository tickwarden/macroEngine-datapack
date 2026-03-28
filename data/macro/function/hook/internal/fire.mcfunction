# macro:hook/internal/fire [MACRO]
# INPUT: $(event) — event name to fire
# @s = tetikleyen oyuncu
# Copies hook_binds list and dispatches it.

$data modify storage macro:engine _hook_fire_event set value "$(event)"

# Rate limit check — block event if player is throttled
execute unless function macro:rate_limit/check_hook run data modify storage macro:engine _hook_iter set from storage macro:engine hook_binds
execute if data storage macro:engine _hook_iter run function macro:hook/internal/dispatch

data remove storage macro:engine _hook_iter
data remove storage macro:engine _hook_fire_event
