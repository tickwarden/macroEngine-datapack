# macro:rate_limit/player/check — Per-player sliding window check [MACRO]
#
# Builds the compound key "player:<key>:<player>" and ensures the bucket exists.
# If no bucket exists yet for this player, auto-creates from the player_template.
#
# Usage:
#   $function macro:rate_limit/player/check {key:"shop",player:"$(player)"}
#
# Rule template must be registered via:
# function macro:rate_limit/player/config {key:"shop",limit:3,window:600}
#
# Output → macro:output result 1b=ALLOWED 0b=DENIED

# Auto-seed: if bucket for this player+key doesn't exist, create from template
$execute unless data storage macro:engine "rate_limit.rules.player:$(key):$(player)" run function macro:rate_limit/player/internal/ensure {tpl:"$(key)",full:"player:$(key):$(player)"}

# Delegate to generic check with full compound key
$function macro:rate_limit/check {key:"player:$(key):$(player)"}
