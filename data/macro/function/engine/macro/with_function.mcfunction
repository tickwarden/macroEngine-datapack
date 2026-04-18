# ─────────────────────────────────────────────
# macro:engine/macro/with_function [MACRO]
#
# Provider (source) fonksiyonunu çalıştırır; fonksiyonun
# macro:engine _macro_pipe storage'ına yazdığı verileri
# consumer (target) fonksiyonuna makro değişken kaynağı olarak iletir.
#
# İki fonksiyon arasında tip-güvenli bir veri köprüsü oluşturur.
#
# Kullanım:
#   function macro:engine/macro/with_function \
#     {source:"ns:provider", target:"ns:consumer"}
#
# Parametreler:
#   source — veriyi üretip macro:engine _macro_pipe'a yazan fonksiyon
#   target — pipe'taki verileri makro değişken olarak tüketen fonksiyon
#
# Sözleşme:
#   source fonksiyonu çıktılarını şu storage'a yazmalıdır:
#     data modify storage macro:engine _macro_pipe.<key> set value <val>
#   target fonksiyonu bu key'leri $(key) şeklinde kullanabilir.
# ─────────────────────────────────────────────

# Source çalışmadan önce pipe'ı temizle
data remove storage macro:engine _macro_pipe

# Provider fonksiyonunu çalıştır — çıktıyı _macro_pipe'a yazar
$function $(source)

# Consumer fonksiyonunu pipe ile besle
$function $(target) with storage macro:engine _macro_pipe

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"engine/macro/with_function ","color":"aqua"},{"text":"$(source)","color":"yellow"},{"text":" ⟶ ","color":"#555555"},{"text":"$(target)","color":"aqua"}]
