# macro:rate_limit/global/config — Register a global (server-wide) rate limit [MACRO]
#
# Usage:
# function macro:rate_limit/global/config {key:"boss_spawn",limit:1,window:24000}
#
# Equivalent to:
# function macro:rate_limit/config {key:"global:boss_spawn",limit:1,window:24000}

$function macro:rate_limit/config {key:"global:$(key)",limit:$(limit),window:$(window)}
