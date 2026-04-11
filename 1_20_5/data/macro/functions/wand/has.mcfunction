# macro:wand/has [1.20.5+]
# Does the player hold a specific wand in their main hand? (component syntax)

data modify storage macro:output result set value 0b
$execute as @a[name=$(player),limit=1] at @s if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/has ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [$(tag)] → ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"}]}
