# ─────────────────────────────────────────────────────────────────
# macro:string/function_suggest
# Sends a message with a title, description and a clickable function suggestion.
# Clicking the button writes "/function macro:<suggest>" to the chat box.
#
# INPUT (storage macro:input):
#   target  → target selector (e.g. "@s", "@a")
#   title   → title text
#   body    → description text
#   suggest → function path (e.g. "lib/fiber/spawn")
#   color   → title and button color (e.g. "aqua")
#
# EXAMPLE:
#   data modify storage macro:input target  set value "@s"
#   data modify storage macro:input title   set value "Fiber Spawn"
#   data modify storage macro:input body    set value "Yeni bir fiber baslatir."
#   data modify storage macro:input suggest set value "lib/fiber/spawn"
#   data modify storage macro:input color   set value "aqua"
#   function macro:string/function_suggest with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$tellraw $(target) [{"text":"$(title)","color":"$(color)","bold":true},{"text":"\n"},{"text":"$(body)","color":"gray","italic":true},{"text":"\n"},{"text":"/function macro:$(suggest)","color":"$(color)","underlined":true,"italic":false,"click_event":{"action":"suggest_command","command":"/function macro:$(suggest)"},"hover_event":{"action":"show_text","value":{"text":"Click to edit","color":"gray","italic":true}}}]