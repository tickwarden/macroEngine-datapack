data modify storage macro:engine dialog.DIALOG set value {"type":"minecraft:multi_action","title":"","inputs":[{"type":"minecraft:text","key":"sys","label":"Modül / Sistem","label_visible":1,"max_length":400000000,"multiline":{}}],"can_close_with_escape":1,"pause":0,"after_action":"close","columns":1,"actions":[{"label":"Uygula","action":{"type":"minecraft:dynamic/run_command","template":"/function macro:flag/toggle_system {system:\"$(sys)\"}"}}]}

execute at @s run function macro:dialog/open
