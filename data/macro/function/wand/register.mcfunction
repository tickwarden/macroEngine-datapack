# ─────────────────────────────────────────────────────────────────
# macro:wand/register
# Belirli bir custom_data tag'ine sahip wand'ı kaydeder.
# Her item kullanımında $(func) veya $(cmd) çalışır.
#
# INPUT:
#   $(tag)  → custom_data tag adı (örn: "my_wand")
#   $(func) → (isteğe bağlı) çalışacak fonksiyon
#   $(cmd)  → (isteğe bağlı) çalışacak komut (func yoksa)
#
# ÇIKIŞ: macro:engine wand_binds listesine kayıt eklenir
#
# ÖRNEK:
#   data modify storage macro:input tag set value "fire_wand"
#   data modify storage macro:input func set value "mypack:on_fire_wand"
#   function macro:wand/register with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

execute unless data storage macro:engine wand_binds run data modify storage macro:engine wand_binds set value []

$execute if data storage macro:input {func:"$(func)"} run data modify storage macro:engine wand_binds append value {tag:"$(tag)", func:"$(func)"}
$execute unless data storage macro:input {func:"$(func)"} run data modify storage macro:engine wand_binds append value {tag:"$(tag)", cmd:"$(cmd)"}

$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"wand/register ","color":"aqua"},{"text":"✔ ","color":"green"},{"text":"$(tag)","color":"white"}]
