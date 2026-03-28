# macroEngine Rate Limit - Reset Counters
# Internal: Reset all player action counters (called every second)

# Reset all player counters
scoreboard players set @a macro.rl_counter 0

# Reset timer
scoreboard players set #rl_global_timer macro.rl_timer 0

return 0
