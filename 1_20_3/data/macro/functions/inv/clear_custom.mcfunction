$execute as @a[name=$(player),limit=1] run clear @s minecraft:carrot_on_a_stick{wand:"$(customData)"} $(count)
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"inv/clear_custom ","color":"aqua"},{"text":"$(player)","color":"white"}]}
