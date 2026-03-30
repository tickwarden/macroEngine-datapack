$execute as @a at @s if entity @e[type=minecraft:chest_minecart,distance=..2,limit=1,tag=$(tag),nbt={Items:[{Slot:$(slot)b,tag:{wand:"$(customData)"}}]}] run $(invoke)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/chest_minecart_if_item ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(tag)","color":"aqua"}]}
