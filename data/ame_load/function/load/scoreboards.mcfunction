scoreboard objectives add macro.tmp dummy
scoreboard objectives add macro.time dummy
scoreboard objectives add macro_menu trigger
scoreboard objectives add macro_run trigger
scoreboard objectives add macro_action trigger
scoreboard objectives add macro.dialog_load dummy
scoreboard objectives add macro.tick_guard dummy
scoreboard objectives add health health {"text":"❤","color":"red"}
scoreboard objectives add ame.pre_version dummy
scoreboard objectives add macro.pid dummy

# Lantern Load integration — pack version tracking
scoreboard objectives add load.status dummy



# Wand module — carrot_on_a_stick right-click tracker
scoreboard objectives add macro.rightClick minecraft.used:minecraft.carrot_on_a_stick

# Hook module scoreboards
scoreboard objectives add macro.hook_online dummy
# BUGFIX: existing players should not re-trigger as new joins after reload
scoreboard players set @a macro.hook_online 1
scoreboard objectives add macro.hook_deaths deathCount
# NOTE: placed_blocks is not a general statistic — must be used as dummy
scoreboard objectives add macro.hook_placed dummy
scoreboard objectives add macro.hook_lvl dummy
scoreboard objectives add macro.hook_lvl_new dummy
# New hook scoreboards
scoreboard objectives add macro.hook_sneak dummy
scoreboard objectives add macro.hook_sprint dummy
scoreboard objectives add macro.hook_elytra dummy
# block_break — item_durability_changed advancement-based
scoreboard objectives add macro.hook_tool_used dummy
# item_use, entity_kill advancement-based
scoreboard objectives add macro.hook_item_used dummy
scoreboard objectives add macro.hook_entity_killed dummy
# using_item, killed_by_arrow, hero_of_the_village
scoreboard objectives add macro.hook_using_item dummy
scoreboard objectives add macro.hook_killed_by_arrow dummy
scoreboard objectives add macro.hook_hero_of_the_village dummy

# geo/region_watch — no scoreboard needed for enter/leave tracking (uses entity tags)

# hook/dimension_change — changed_dimension advancement-based
scoreboard objectives add macro.hook_dim_changed dummy

# hook/trade — villager_trade advancement-based
scoreboard objectives add macro.hook_traded dummy

# Tick channel dispatch
scoreboard objectives add macro.tick dummy
scoreboard objectives add macro.Flags dummy

# Player stat hooks
scoreboard objectives add macro.hook_jump minecraft.custom:minecraft.jump
scoreboard objectives add macro.hook_open_chest minecraft.custom:minecraft.open_chest
scoreboard objectives add macro.hook_drop minecraft.custom:minecraft.drop
scoreboard objectives add macro.hook_target_hit minecraft.custom:minecraft.target_hit

# hook/eat — consume_item advancement-based
scoreboard objectives add macro.hook_eat dummy
# hook/fish_caught — fishing_rod_hooked advancement-based
scoreboard objectives add macro.hook_fish dummy

# Version calculation constants (for Lantern Load integration)
scoreboard players set #10000 macro.tmp 10000
scoreboard players set #100 macro.tmp 100
