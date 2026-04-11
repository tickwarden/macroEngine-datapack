$execute store result storage macro:output result double 1 run attribute @a[name=$(player),limit=1] $(attribute) get
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"cmd/attribute_get ","color":"aqua"},{"text":"$(player)","color":"white"}]}
