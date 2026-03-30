# macro:wand/give [LEGACY]
# Gives the player a carrot_on_a_stick marked as a wand.

$give @a[name=$(player),limit=1] minecraft:carrot_on_a_stick{wand:"$(tag)",display:{Name:'{"text":"$(name)"}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1s}],HideFlags:1}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]}
