# AME Tick Engine v2 — Entry Point
# Driven by #minecraft:tick function tag (guaranteed 1/game-tick, no drift).
#
# All rate/offset/condition/pause logic is inside the channel dispatcher.
# Do NOT add any per-system logic here — register a channel instead.

# Guard: no players online → nothing to process
execute unless entity @a run return 0

# Guard: engine not initialised
execute unless data storage macro:engine global{loaded:1b} run return 0

# Guard: globally paused (macro:tick/pause / macro:tick/resume)
execute if data storage macro:engine tick{paused:1b} run return 0

# Dispatch all registered channels
function macro:tick/dispatch

# Online player count — kept for compatibility
execute store result score #online macro.onlinePlayers if entity @a