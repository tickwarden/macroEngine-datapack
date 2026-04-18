# ─────────────────────────────────────────────
# macro:engine/macro/with_advancement [MACRO]
#
# Bir oyuncunun belirli bir advancement'ı tamamlayıp tamamlamadığını
# kontrol eder; sonucu named makro değişkeni olarak hedef fonksiyona iletir.
#
# Kullanım:
#   function macro:engine/macro/with_advancement \
#     {func:"ns:path", player:"Name", advancement:"ns:adv/path", var:"done"}
#
# Parametreler:
#   func        — çalıştırılacak fonksiyon (ns:path)
#   player      — hedef oyuncu adı
#   advancement — kontrol edilecek advancement (ns:path/to/adv)
#   var         — fonksiyona aktarılacak makro değişken adı
#
# Çıktı: $(done) → 1b (tamamlandı) veya 0b (tamamlanmadı)
# ─────────────────────────────────────────────

# Pipe'ı temizle
data remove storage macro:engine _macro_pipe

# Varsayılan: tamamlanmadı
$data modify storage macro:engine _macro_pipe.$(var) set value 0b

# Oyuncu advancement'ı tamamladıysa 1b olarak güncelle
$execute as @a[name=$(player),limit=1,advancements={"$(advancement)":{done:true}}] run data modify storage macro:engine _macro_pipe.$(var) set value 1b

# Hedef fonksiyonu pipe üzerinden çalıştır
$function $(func) with storage macro:engine _macro_pipe

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"engine/macro/with_advancement ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"#555555"},{"text":"$(advancement)","color":"yellow"},{"text":"] ","color":"#555555"},{"text":"$(var)","color":"green"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
