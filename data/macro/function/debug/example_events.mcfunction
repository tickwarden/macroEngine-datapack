tellraw @a[tag=macro.debug] {"text":"[DEBUG] Event system test starting...","color":"yellow"}

data modify storage macro:input event set value "on_join"
data modify storage macro:input func set value "macro:debug/internal/on_join_handler"
function macro:event/register with storage macro:input {}

data modify storage macro:input event set value "on_kill"
data modify storage macro:input func set value "macro:debug/internal/on_kill_handler"
function macro:event/register with storage macro:input {}

data remove storage macro:engine event_context
data modify storage macro:engine event_context.player set value "TestPlayer"
data modify storage macro:engine event_context.reason set value "debug_test"

data modify storage macro:input event set value "on_join"
function macro:event/fire with storage macro:input {}
data remove storage macro:input event

tellraw @a[tag=macro.debug] {"text":"[DEBUG] example_events completed.","color":"green"}
