# macro:rate_limit/check — Sliding window check + consume [MACRO]
#
# The core API call. Checks whether the key is under its configured limit
# for the current sliding window, then records this hit.
#
# Output → macro:output result
# 1b = ALLOWED (hit was recorded, call may proceed)
# 0b = DENIED (limit reached, hit NOT recorded)
#
# Usage:
# function macro:rate_limit/check {key:"global:my_event"}
# execute if data storage macro:output {result:1b} run function my_ns:do_thing
#
# For per-player (build key in caller):
#   $function macro:rate_limit/check {key:"player:shop:$(player)"}
#
# Rule must be pre-registered via macro:rate_limit/config.
# If no rule exists for the key → ALLOWED (fail-open; log warning).

data modify storage macro:output result set value 1b

# Guard: rule must exist — try auto-create from player template first
# Key format "player:<tpl>:<name>" → tpl is the second segment
# We attempt player_ensure unconditionally; it exits early if not a player key or no template
$data modify storage macro:rl_work ensure_key set value "$(key)"
function macro:rate_limit/internal/player_check with storage macro:rl_work

$execute unless data storage macro:engine rate_limit.rules.$(key) run function macro:rate_limit/internal/no_rule
$execute unless data storage macro:engine rate_limit.rules.$(key) run return 0

# Copy rule into work storage with key context
$data modify storage macro:rl_work rule set from storage macro:engine rate_limit.rules.$(key)
$data modify storage macro:rl_work rule.key set value "$(key)"

# Run the sliding window evaluation
function macro:rate_limit/internal/evaluate with storage macro:rl_work rule
