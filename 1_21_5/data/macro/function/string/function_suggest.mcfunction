# ─────────────────────────────────────────────────────────────────
# macro:string/function_suggest
# Başlık, açıklama ve tıklanabilir fonksiyon önerisi içeren mesaj gönderir.
# Butona tıklayınca "/function macro:<suggest>" chat kutusuna yazılır.
#
# INPUT (storage macro:input):
#   target  → hedef seçici (örn: "@s", "@a")
#   title   → başlık metni
#   body    → açıklama metni
#   suggest → fonksiyon yolu (örn: "lib/fiber/spawn")
#   color   → başlık ve buton rengi (örn: "aqua")
#
# ÖRNEK:
#   data modify storage macro:input target  set value "@s"
#   data modify storage macro:input title   set value "Fiber Spawn"
#   data modify storage macro:input body    set value "Yeni bir fiber baslatir."
#   data modify storage macro:input suggest set value "lib/fiber/spawn"
#   data modify storage macro:input color   set value "aqua"
#   function macro:string/function_suggest with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$tellraw $(target) [{"text":"$(title)","color":"$(color)","bold":true},{"text":"\n"},{"text":"$(body)","color":"gray","italic":true},{"text":"\n"},{"text":"/function macro:$(suggest)","color":"$(color)","underlined":true,"italic":false,"click_event":{"action":"suggest_command","command":"/function macro:$(suggest)"},"hover_event":{"action":"show_text","value":{"text":"Tıkla ve düzenle","color":"gray","italic":true}}}]