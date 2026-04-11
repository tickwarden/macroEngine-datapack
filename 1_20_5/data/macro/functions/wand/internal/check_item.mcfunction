# macro:wand/internal/check_item [1.20.5+]
# Uses execute if items instead of NBT selector (component syntax).

$execute if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run function macro:wand/internal/fire with storage macro:engine _wand_current
