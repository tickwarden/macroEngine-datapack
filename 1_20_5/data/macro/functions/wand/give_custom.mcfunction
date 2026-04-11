# macro:wand/give_custom [1.20.5+]
# Gives a custom item tagged as a wand (component syntax).

$give @a[name=$(player),limit=1] $(item)[minecraft:custom_data={wand:"$(tag)"},minecraft:custom_name='{"text":"$(name)"}',minecraft:enchantments={levels:{"minecraft:unbreaking":1}},minecraft:hide_additional_tooltip={}] $(count)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give_custom ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(item)","color":"aqua"},{"text":" [$(tag)]","color":"#555555"}]}
