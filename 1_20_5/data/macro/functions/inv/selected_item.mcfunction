# macro:inv/selected_item [1.20.5+]
$execute as @a at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(customData)"}] run $(invoke)
