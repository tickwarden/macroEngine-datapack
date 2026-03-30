# macro:wand/give_custom [LEGACY]
# Gives a custom item tagged as a wand.

$give @a[name=$(player),limit=1] $(item){wand:"$(tag)",display:{Name:'{"text":"$(name)"}'},Enchantments:[{id:"minecraft:unbreaking",lvl:1s}],HideFlags:1} $(count)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give_custom ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(item)","color":"aqua"},{"text":" [$(tag)]","color":"#555555"}]}
