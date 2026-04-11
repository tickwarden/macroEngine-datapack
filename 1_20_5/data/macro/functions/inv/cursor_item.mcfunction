# macro:inv/cursor_item [1.20.5+]
# Detect click by checking if the item exists in that slot (component syntax)
$execute unless items entity @e[type=chest_minecart,tag=$(id),limit=1,sort=nearest,distance=..3] container.$(slot) $(item)[minecraft:custom_data~$(data)] run $(invoke)

# Optional: Restore the item in the slot after click (prevents item disappearing)
$item replace entity @e[type=chest_minecart,tag=$(id),limit=1,sort=nearest] container.$(slot) with $(item)[minecraft:custom_data=$(data)] $(count)

# Clear the item from player's cursor
$clear @s $(item)[minecraft:custom_data=$(data)] $(count)
