$scoreboard players set $pb1_seg macro.tmp $(current)
$scoreboard players set $pb1_max macro.tmp $(max)

execute if score $pb1_max macro.tmp matches ..0 run return fail

scoreboard players set $pb1_ten macro.tmp 10
scoreboard players operation $pb1_seg macro.tmp *= $pb1_ten macro.tmp
scoreboard players operation $pb1_seg macro.tmp /= $pb1_max macro.tmp

execute if score $pb1_seg macro.tmp matches ..0 run scoreboard players set $pb1_seg macro.tmp 0
execute if score $pb1_seg macro.tmp matches 10.. run scoreboard players set $pb1_seg macro.tmp 10

$execute if score $pb1_seg macro.tmp matches 0 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ░░░░░░░░░░"}
$execute if score $pb1_seg macro.tmp matches 1 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) █░░░░░░░░░"}
$execute if score $pb1_seg macro.tmp matches 2 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ██░░░░░░░░"}
$execute if score $pb1_seg macro.tmp matches 3 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ███░░░░░░░"}
$execute if score $pb1_seg macro.tmp matches 4 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ████░░░░░░"}
$execute if score $pb1_seg macro.tmp matches 5 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) █████░░░░░"}
$execute if score $pb1_seg macro.tmp matches 6 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ██████░░░░"}
$execute if score $pb1_seg macro.tmp matches 7 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ███████░░░"}
$execute if score $pb1_seg macro.tmp matches 8 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ████████░░"}
$execute if score $pb1_seg macro.tmp matches 9 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) █████████░"}
$execute if score $pb1_seg macro.tmp matches 10 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ██████████"}
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/progress_bar ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" → ","color":"#555555"},{"text":"$(label)","color":"aqua"}]
