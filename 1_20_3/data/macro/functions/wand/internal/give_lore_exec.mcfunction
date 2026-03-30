# macro:wand/internal/give_lore_exec [LEGACY]
# Writes with lore directly to mainhand via item replace.

$item replace entity @a[name=$(player),limit=1] weapon.mainhand with minecraft:carrot_on_a_stick{wand:"$(tag)",display:{Name:'{"text":"$(name)"}',Lore:['{"text":"$(lore)","italic":false,"color":"$(color)"}']},Enchantments:[{id:"minecraft:unbreaking",lvl:1s}],HideFlags:1}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give_lore ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]}
