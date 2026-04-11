$execute as @a[scores={$(name)=1..}] run function macro:perm/trigger/internal/player_dispatch with storage macro:engine _pt_tick_ctx

$execute as @a run scoreboard players enable @s $(name)
