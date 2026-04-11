# macro:inv/player_slot_if_item [1.20.5+]
# Checks the whole inventory (slot-specific routing via execute if items).
$execute as @a[name=$(player),limit=1] at @s if items entity @s container.* *[minecraft:custom_data~{wand:"$(customData)"}] run $(invoke)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/player_slot_if_item ","color":"aqua"},{"text":"$(player)","color":"white"}]}
