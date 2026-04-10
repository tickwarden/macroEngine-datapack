# ─────────────────────────────────────────────────────────────────
# macro:hook/on_fish_caught
# Fires when a player catches a fish.
# Based on the fishing_rod_hooked advancement.
#
# INPUT:
#   $(func) or $(cmd) → function/command to trigger
#   $(tag)              → (optional) bind tag
#
# USAGE:
# function macro:hook/bind {event:"fish_caught",func:"mypack:on_fish"}
# ─────────────────────────────────────────────────────────────────
$function macro:hook/bind {event:"fish_caught",func:"$(func)"}
