# ─────────────────────────────────────────────────────────────────
# macro:hook/on_advancement_fire
# Called from the user's own advancement reward function.
# Fires an event in "advancement:<id>" format.
#
# INPUT (storage macro:input):
#   advancement → advancement ID (e.g. "story/mine_stone")
#
# KULLANIM:
#   1) Define a function as the reward in your advancement JSON:
#      "rewards": {"function": "mypack:advancements/mine_stone"}
#
#   2) Inside that function:
#      data modify storage macro:input advancement set value "story/mine_stone"
#      function macro:hook/on_advancement_fire
#
#   3) Hook bind:
#      data modify storage macro:input event set value "advancement:story/mine_stone"
#      data modify storage macro:input func  set value "mypack:on_first_mine"
#      function macro:hook/bind
# ─────────────────────────────────────────────────────────────────

function macro:hook/internal/on_advancement_fire with storage macro:input {}
