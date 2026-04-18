# ─────────────────────────────────────────────
# macro:engine/macro/with_score [MACRO]
#
# Reads a player's scoreboard value and injects it as a named
# macro variable into the target function.
#
# Kullanım:
#   function macro:engine/macro/with_score \
#     {func:"ns:path", player:"Name", objective:"myObj", var:"myVar"}
#
# Parametreler:
#   func      — çalıştırılacak fonksiyon (ns:path)
#   player    — hedef oyuncu adı
#   objective — scoreboard objective
#   var       — fonksiyona aktarılacak makro değişken adı
#
# Çıktı: $(myVar) → scoreboard değeri (int)
# ─────────────────────────────────────────────

# Pipe'ı temizle
data remove storage macro:engine _macro_pipe

# Score değerini istenen değişken adıyla pipe'a yaz
$execute store result storage macro:engine _macro_pipe.$(var) int 1 run scoreboard players get $(player) $(objective)

# Hedef fonksiyonu pipe üzerinden çalıştır
$function $(func) with storage macro:engine _macro_pipe

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"engine/macro/with_score ","color":"aqua"},{"text":"$(player)","color":"white"},{"text":" [","color":"#555555"},{"text":"$(objective)","color":"yellow"},{"text":"] ","color":"#555555"},{"text":"$(var)","color":"green"},{"text":" → ","color":"#555555"},{"text":"$(func)","color":"aqua"}]
