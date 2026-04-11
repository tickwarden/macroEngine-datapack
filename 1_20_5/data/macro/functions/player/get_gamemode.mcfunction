# macro:player/get_gamemode [MACRO]
# Returns the gamemode of a named player as an integer.
#
# INPUT:  $(player) — player name
# OUTPUT: macro:output result — 0=survival, 1=creative, 2=adventure, 3=spectator
# macro:output name — "survival" | "creative" | "adventure" | "spectator"
# macro:output found — 1b if player exists, 0b otherwise
#
# EXAMPLE:
# function macro:player/get_gamemode {player:"Steve"}
# data get storage macro:output name

data modify storage macro:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macro:output found set value 1b

$execute if entity @a[name=$(player),gamemode=survival,limit=1] run data modify storage macro:output result set value 0
$execute if entity @a[name=$(player),gamemode=creative,limit=1] run data modify storage macro:output result set value 1
$execute if entity @a[name=$(player),gamemode=adventure,limit=1] run data modify storage macro:output result set value 2
$execute if entity @a[name=$(player),gamemode=spectator,limit=1] run data modify storage macro:output result set value 3

$execute if entity @a[name=$(player),gamemode=survival,limit=1] run data modify storage macro:output name set value "survival"
$execute if entity @a[name=$(player),gamemode=creative,limit=1] run data modify storage macro:output name set value "creative"
$execute if entity @a[name=$(player),gamemode=adventure,limit=1] run data modify storage macro:output name set value "adventure"
$execute if entity @a[name=$(player),gamemode=spectator,limit=1] run data modify storage macro:output name set value "spectator"

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"player/get_gamemode ","color":"aqua"},{"text":"$(player) → ","color":"gray"},{"storage":"macro:output","nbt":"name","color":"green"}]
