# macro:string/function_suggest [compat_1_21_4 overlay]
# 1.21.4 and earlier: uses clickEvent/hoverEvent (legacy format) with suggest value field.

$tellraw $(target) [{"text":"$(title)","color":"$(color)","bold":true},{"text":"\n"},{"text":"$(body)","color":"gray","italic":true},{"text":"\n"},{"text":"/function macro:$(suggest)","color":"$(color)","underlined":true,"italic":false,"clickEvent":{"action":"suggest_command","value":"/function macro:$(suggest)"},"hoverEvent":{"action":"show_text","value":{"text":"Click to edit","color":"gray","italic":true}}}]
