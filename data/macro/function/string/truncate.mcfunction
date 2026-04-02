# ─────────────────────────────────────────────────────────────────
# macro:string/truncate
# Displays text in the named player's actionbar, optionally with a
# suffix to indicate truncation. The caller decides whether the text
# needs truncating and passes truncated:1b or truncated:0b.
# Because mcfunction cannot measure string byte-length at runtime,
# length-checking must be done externally (e.g. via a scoreboard counter
# in the calling pack).
#
# INPUT : $(player)    → player name
#         $(text)      → string to display
#         $(suffix)    → suffix shown when truncated (e.g. "...")
#         $(truncated) → 1b = append suffix, 0b = show as-is
# OUTPUT: macro:output text → stored original text
#
# EXAMPLE:
#   function macro:string/truncate {player:"Steve",text:"Hello Wor",suffix:"...",truncated:1b}
#   → actionbar: "Hello Wor..."
# ─────────────────────────────────────────────────────────────────

$data modify storage macro:output text set value $(text)
$data modify storage macro:engine _trunc_t set value $(truncated)

scoreboard players set $trunc_flag macro.tmp 0
execute store result score $trunc_flag macro.tmp run data get storage macro:engine _trunc_t

$execute if score $trunc_flag macro.tmp matches 0 run title @a[name=$(player),limit=1] actionbar {"storage":"macro:output","nbt":"text"}
$execute if score $trunc_flag macro.tmp matches 1.. run title @a[name=$(player),limit=1] actionbar ["",{"storage":"macro:output","nbt":"text"},{"text":"$(suffix)","color":"gray"}]

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"string/truncate ","color":"aqua"},{"text":"$(player) truncated=$(truncated)","color":"gray"}]
