# ─────────────────────────────────────────────────────────────────
# macro:inv/offhand_item
# Runs a command/function for each player in @a whose offhand
# matches the given item id and custom data.
# Mirrors the pattern of macro:inv/selected_item (mainhand).
#
# INPUT : $(item)       → item id (e.g. "minecraft:shield")
#         $(customData) → custom_data compound to match (e.g. "{my_tag:1b}")
#         $(invoke)     → command to run as the matching player
#
# EXAMPLE:
# function macro:inv/offhand_item {item:"minecraft:shield",customData:"{my_tag:1b}",invoke:"function mypack:on_shield"}
# ─────────────────────────────────────────────────────────────────

return run tellraw @s {"text":"This feature requires 1.21.x or higher!","color":"red","italic":false}
