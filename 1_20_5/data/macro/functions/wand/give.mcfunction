# macro:wand/give [1.20.5+]
# Gives the player a carrot_on_a_stick marked as a wand (component syntax).

$give @a[name=$(player),limit=1] minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:custom_name='{"text":"$(name)"}',minecraft:enchantments={levels:{"minecraft:unbreaking":1}},minecraft:hide_additional_tooltip={}]
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]}
