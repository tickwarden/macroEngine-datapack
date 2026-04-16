# type:"cmd" → {cmd:"say hello"}
# Güvenlik: yalnızca macro.admin etiketli executors çalıştırabilir.
execute unless entity @s[tag=macro.admin] run return 0
$execute as @a[nbt=$(uuid)] at @s run $(cmd)
