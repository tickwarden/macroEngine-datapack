execute as @a run function macro:lib/tick_guard_clear

execute as @a[scores={macro_menu=1..}] run function macro:menu
scoreboard players set @a[scores={macro_menu=1..}] macro_menu 0
scoreboard players enable @a[scores={macro_menu=-1..}] macro_menu

execute as @a[scores={macro_run=1..}] run function #macro:run
scoreboard players set @a[scores={macro_run=1..}] macro_run 0
scoreboard players enable @a[scores={macro_run=-1..}] macro_run

execute as @a[scores={macro_action=1..}] run function macro:trigger/internal/dispatch

function macro:interaction/internal/tick_scan

function macro:perm/trigger/internal/tick_start

function macro:wand/internal/tick_scan
