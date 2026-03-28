# macro:wand/give [compat_1_21_4 overlay — pack_format 48–61]
# 1.21.4 and below: item_name uses legacy ' string syntax.
#
# INPUT: $(player), $(tag), $(name)

$give @a[name=$(player),limit=1] minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name='"$(name)"',minecraft:enchantment_glint_override=true]
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]
