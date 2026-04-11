# ─────────────────────────────────────────────────────────────────
# macro:hook/on_eat
# Fires when a player eats food.
# Based on the consume_item advancement.
#
# INPUT:
#   $(func) or $(cmd) → function/command to trigger
#   $(tag)              → (optional) bind tag
#
# USAGE:
# function macro:hook/bind {event:"eat",func:"mypack:on_eat"}
# ─────────────────────────────────────────────────────────────────
$function macro:hook/bind {event:"eat",func:"$(func)"}
