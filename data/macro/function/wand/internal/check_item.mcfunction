# macro:wand/internal/check_item [MACRO]
# $(tag) → custom_data tag adı
# Oyuncunun ana elindeki item bu tag'i taşıyorsa bind'ı çalıştır.

$execute if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run function macro:wand/internal/fire with storage macro:engine _wand_current
