# AME Tick — Rate/Offset Check [MACRO]
# Fires when (#tick_ctr - offset) % rate == 0.
# Input: $(rate), $(offset), $(fn), $(condition)
#
# rate:1 = every tick | rate:20 = every second | rate:200 = every 10s
# offset: phase shift, spreads channels so they don't all run on the same tick

$scoreboard players set #rate macro.tick $(rate)
$scoreboard players set #offset macro.tick $(offset)

# Compute modular position
scoreboard players operation #check macro.tick = #tick_ctr macro.tick
scoreboard players operation #check macro.tick -= #offset macro.tick
scoreboard players operation #check macro.tick %= #rate macro.tick

# Fix negative remainder (possible when tick_ctr < offset at world start)
execute if score #check macro.tick matches ..-1 run scoreboard players operation #check macro.tick += #rate macro.tick

# Not this tick → skip
execute unless score #check macro.tick matches 0 run return 0

# Passed → execute channel function
function macro:tick/dispatch/exec with storage macro:tick_work channel
function macro:tick/dispatch/exec2 with storage macro:tick_work channel