$execute unless data storage macro:engine events.$(event) run return 0

$data modify storage macro:engine queue append value {func:"macro:event/internal/fire_deferred", delay:$(delay), event:"$(event)"}
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"event/fire_queued ","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"$(event)","color":"aqua"}]}
