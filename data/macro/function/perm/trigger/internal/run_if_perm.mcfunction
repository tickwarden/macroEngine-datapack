# ============================================
# macro:perm/trigger/internal/run_if_perm
# ============================================
# @s (oyuncu) için izin tag kontrolü yapar.
# macro.admin tag veya perm.<perm> tag → exec çağırır.
# İkisi de yoksa oyuncuya permission denied mesajı gönderir.
#
# INPUT (makro): storage macro:engine _ptd_current
# = {value:<int>, func:"..." veya cmd:"...", perm:"<izin>"}
# Çağrı: AS @s (the player)
# ============================================

# admin bypass
execute if entity @s[tag=macro.admin] run function macro:perm/trigger/internal/exec with storage macro:engine _ptd_current

# perm tag kontrolü (admin değilse)
$execute unless entity @s[tag=macro.admin] if entity @s[tag=perm.$(perm)] run function macro:perm/trigger/internal/exec with storage macro:engine _ptd_current

# Her ikisi de yoksa → permission denied
$execute unless entity @s[tag=macro.admin] unless entity @s[tag=perm.$(perm)] run tellraw @s ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" iznine sahip değilsiniz.","color":"red"}]
