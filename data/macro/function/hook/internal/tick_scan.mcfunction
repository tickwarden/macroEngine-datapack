# macro:hook/internal/tick_scan
# Her tick'te hook event'lerini tespit eder.
# Runs only if hook_binds is non-empty.

execute unless data storage macro:engine hook_binds[0] run return 0

# player_join — macro.hook_online score'u olmayan online oyuncu
# BUGFIX: existing players should not trigger after reload (scoreboards.mcfunction sets @a → 1)
execute as @a[scores={macro.hook_online=..0}] run function macro:hook/internal/on_player_join
execute as @a run scoreboard players set @s macro.hook_online 1

# player_death — detect deaths score increase
execute as @a[scores={macro.hook_deaths=1..}] run function macro:hook/internal/on_player_death
execute as @a[scores={macro.hook_deaths=1..}] run scoreboard players set @s macro.hook_deaths 0

# player_respawn — was dead (dead flag set) but alive again
execute as @a[tag=macro.hook_dead,nbt={DeathTime:0s}] run function macro:hook/internal/on_player_respawn
execute as @a[tag=macro.hook_dead,nbt={DeathTime:0s}] run tag @s remove macro.hook_dead
execute as @a[nbt={DeathTime:1s}] run tag @s add macro.hook_dead

# level_up — XP level increase
execute as @a run function macro:hook/internal/check_level_up

# block_place — advancement-based, placed_blocks score increase
execute as @a[scores={macro.hook_placed=1..}] run function macro:hook/internal/on_block_place
execute as @a[scores={macro.hook_placed=1..}] run scoreboard players set @s macro.hook_placed 0

# block_break — statistic-based (no advancement trigger in 1.21.x)
execute as @a run function macro:hook/internal/check_block_break

# item_use — advancement-based, score increase
execute as @a[scores={macro.hook_item_used=1..}] run function macro:hook/internal/on_item_use
execute as @a[scores={macro.hook_item_used=1..}] run scoreboard players set @s macro.hook_item_used 0


# entity_kill — advancement-based, score increase
execute as @a[scores={macro.hook_entity_killed=1..}] run function macro:hook/internal/on_entity_kill
execute as @a[scores={macro.hook_entity_killed=1..}] run scoreboard players set @s macro.hook_entity_killed 0

# using_item — item_durability_changed advancement-based
execute as @a[scores={macro.hook_using_item=1..}] run function macro:hook/internal/on_using_item
execute as @a[scores={macro.hook_using_item=1..}] run scoreboard players set @s macro.hook_using_item 0

# killed_by_arrow — entity_killed_player + killing_blow:arrow advancement-based
execute as @a[scores={macro.hook_killed_by_arrow=1..}] run function macro:hook/internal/on_killed_by_arrow
execute as @a[scores={macro.hook_killed_by_arrow=1..}] run scoreboard players set @s macro.hook_killed_by_arrow 0

# hero_of_the_village — raid victory advancement-based
execute as @a[scores={macro.hook_hero_of_the_village=1..}] run function macro:hook/internal/on_hero_of_the_village
execute as @a[scores={macro.hook_hero_of_the_village=1..}] run scoreboard players set @s macro.hook_hero_of_the_village 0

# sneak_start / sneak_stop — predicate-based
execute as @a[scores={macro.hook_sneak=..0},predicate=macro:is_sneaking] run function macro:hook/internal/on_sneak_start
execute as @a[scores={macro.hook_sneak=1},predicate=!macro:is_sneaking] run function macro:hook/internal/on_sneak_stop
execute as @a[predicate=macro:is_sneaking] run scoreboard players set @s macro.hook_sneak 1
execute as @a[predicate=!macro:is_sneaking] run scoreboard players set @s macro.hook_sneak 0

# sprint_start / sprint_stop — predicate-based
execute as @a[scores={macro.hook_sprint=..0},predicate=macro:is_sprinting] run function macro:hook/internal/on_sprint_start
execute as @a[scores={macro.hook_sprint=1},predicate=!macro:is_sprinting] run function macro:hook/internal/on_sprint_stop
execute as @a[predicate=macro:is_sprinting] run scoreboard players set @s macro.hook_sprint 1
execute as @a[predicate=!macro:is_sprinting] run scoreboard players set @s macro.hook_sprint 0

# elytra_start / elytra_stop — predicate-based
execute as @a[scores={macro.hook_elytra=..0},predicate=macro:is_gliding] run function macro:hook/internal/on_elytra_start
execute as @a[scores={macro.hook_elytra=1},predicate=!macro:is_gliding] run function macro:hook/internal/on_elytra_stop
execute as @a[predicate=macro:is_gliding] run scoreboard players set @s macro.hook_elytra 1
execute as @a[predicate=!macro:is_gliding] run scoreboard players set @s macro.hook_elytra 0


execute as @a[scores={macro.hook_dim_changed=1..}] run function macro:hook/internal/on_dimension_change
execute as @a[scores={macro.hook_dim_changed=1..}] run scoreboard players set @s macro.hook_dim_changed 0

execute as @a[scores={macro.hook_traded=1..}] run function macro:hook/internal/on_trade
execute as @a[scores={macro.hook_traded=1..}] run scoreboard players set @s macro.hook_traded 0
