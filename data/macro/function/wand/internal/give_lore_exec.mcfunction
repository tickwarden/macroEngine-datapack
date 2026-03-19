# macro:wand/internal/give_lore_exec [MACRO]
# INPUT (macro): $(player), $(tag), $(name), $(lore), $(color)
#
# item replace weapon.mainhand ile doğrudan mainhand'e lore dahil yazar.
# give değil item replace — slot 0'a (mainhand) direkt koyar.

$item replace entity @a[name=$(player),limit=1] weapon.mainhand with minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name={"text":"$(name)"},minecraft:lore=[{"text":"$(lore)","italic":false,"color":"$(color)"}],minecraft:enchantment_glint_override=true]

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/give_lore ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]
