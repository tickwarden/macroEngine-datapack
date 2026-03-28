# macro:hook/on_break_block
# Reward: break_block advancement (item_durability_changed, delta max -1)
# Feeds both break_block and using_item hooks.
advancement revoke @s only macro:hook/break_block
scoreboard players add @s macro.hook_tool_used 1
scoreboard players add @s macro.hook_using_item 1
