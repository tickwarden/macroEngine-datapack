# ─────────────────────────────────────────────────────────────────
# macro:lib/fiber/spawn
# Starts a new fiber and immediately runs its first step.
# If spawned with the same id, the existing fiber is replaced.
#
# INPUT (storage macro:input):
#   id   → fiber id (unique string)
#   func → function name to start
#
# EXAMPLE:
#   data modify storage macro:input id   set value "boss_intro"
#   data modify storage macro:input func set value "mypack:boss/step_0"
#   function macro:lib/fiber/spawn
# ─────────────────────────────────────────────────────────────────

function macro:lib/fiber/internal/spawn_exec with storage macro:input {}
