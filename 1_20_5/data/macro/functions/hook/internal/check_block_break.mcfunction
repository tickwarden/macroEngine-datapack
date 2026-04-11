# macro:hook/internal/check_block_break
# @s = player being checked
#
# METHOD:
# item_durability_changed advancement -> macro.hook_tool_used score increments.
# tick_scan calls this per player; fires on_block_break if score >= 1.
#
# KNOWN LIMITATION:
# Hand-breaking (cobweb, snow, leaves) is not detectable in 1.21.x
# via advancement triggers. Tool-based breaking only.
# Mob hits also trigger item_durability_changed (sword, axe, etc.).
execute unless score @s macro.hook_tool_used matches 1.. run return 0
function macro:hook/internal/on_block_break
scoreboard players set @s macro.hook_tool_used 0
