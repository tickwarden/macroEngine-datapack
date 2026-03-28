# macro:wand/give_custom [compat_1_21_4 overlay — pack_format 48–61]
# 1.21.4 and below: item_name uses legacy ' string syntax.
#
# INPUT: $(player), $(item), $(tag), $(name), $(count)

$give @a[name=$(player),limit=1] $(item)[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name='"$(name)"',minecraft:enchantment_glint_override=true] $(count)
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give_custom ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(item)","color":"aqua"},{"text":" [$(tag)]","color":"#555555"}]
