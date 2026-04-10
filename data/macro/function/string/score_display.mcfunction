# ─────────────────────────────────────────────────────────────────
# macro:string/score_display
# Sends a formatted label: value line from a scoreboard objective.
#  Input : $(target)    → selector to receive the message
#          $(label)     → display label (e.g. "Points")
#          $(player)    → scoreboard player name (e.g. "@s", "<player name>")
#          $(objective) → scoreboard objective name
#          $(color)     → value color (e.g. "green", "gold")
#
# Example:
# data modify storage macro:input target set value "@s"
# data modify storage macro:input label set value "Points"
# data modify storage macro:input player set value "@s"
# data modify storage macro:input objective set value "myPoints"
# data modify storage macro:input color set value "green"
# function macro:string/score_display with storage macro:input {}
# # Output: "Points 42" (42 from scoreboard)
# ─────────────────────────────────────────────────────────────────

$tellraw $(target) ["",{"text":"$(label)","color":"gray"},{"text":"  ","color":"#555555"},{"score":{"name":"$(player)","objective":"$(objective)"},"color":"$(color)","bold":true}]
