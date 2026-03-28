$scoreboard players set $sin_d macro.tmp $(deg)

# Wrap to range 0-359
scoreboard players set $sin_360 macro.tmp 360
scoreboard players operation $sin_d macro.tmp %= $sin_360 macro.tmp
execute if score $sin_d macro.tmp matches ..-1 run scoreboard players operation $sin_d macro.tmp += $sin_360 macro.tmp

# Sign: 180-359 → negative
scoreboard players set $sin_nf macro.tmp 1
execute if score $sin_d macro.tmp matches 180..359 run scoreboard players set $sin_nf macro.tmp -1
# 180-359 → 0-179'a indir
execute if score $sin_d macro.tmp matches 180..359 run scoreboard players remove $sin_d macro.tmp 180

# 91-179 → simetri: sin(deg) = sin(180-deg)
# tmp2 = 180 - sin_d  (only for range 91-179)
scoreboard players set $sin_180 macro.tmp 180
execute if score $sin_d macro.tmp matches 91..179 run scoreboard players operation $sin_180 macro.tmp -= $sin_d macro.tmp
execute if score $sin_d macro.tmp matches 91..179 run scoreboard players operation $sin_d macro.tmp = $sin_180 macro.tmp

# Lookup table 0-90 → sin × 1000
execute if score $sin_d macro.tmp matches 0 run scoreboard players set $sin_r macro.tmp 0
execute if score $sin_d macro.tmp matches 1 run scoreboard players set $sin_r macro.tmp 17
execute if score $sin_d macro.tmp matches 2 run scoreboard players set $sin_r macro.tmp 35
execute if score $sin_d macro.tmp matches 3 run scoreboard players set $sin_r macro.tmp 52
execute if score $sin_d macro.tmp matches 4 run scoreboard players set $sin_r macro.tmp 70
execute if score $sin_d macro.tmp matches 5 run scoreboard players set $sin_r macro.tmp 87
execute if score $sin_d macro.tmp matches 6 run scoreboard players set $sin_r macro.tmp 105
execute if score $sin_d macro.tmp matches 7 run scoreboard players set $sin_r macro.tmp 122
execute if score $sin_d macro.tmp matches 8 run scoreboard players set $sin_r macro.tmp 139
execute if score $sin_d macro.tmp matches 9 run scoreboard players set $sin_r macro.tmp 156
execute if score $sin_d macro.tmp matches 10 run scoreboard players set $sin_r macro.tmp 174
execute if score $sin_d macro.tmp matches 11 run scoreboard players set $sin_r macro.tmp 191
execute if score $sin_d macro.tmp matches 12 run scoreboard players set $sin_r macro.tmp 208
execute if score $sin_d macro.tmp matches 13 run scoreboard players set $sin_r macro.tmp 225
execute if score $sin_d macro.tmp matches 14 run scoreboard players set $sin_r macro.tmp 242
execute if score $sin_d macro.tmp matches 15 run scoreboard players set $sin_r macro.tmp 259
execute if score $sin_d macro.tmp matches 16 run scoreboard players set $sin_r macro.tmp 276
execute if score $sin_d macro.tmp matches 17 run scoreboard players set $sin_r macro.tmp 292
execute if score $sin_d macro.tmp matches 18 run scoreboard players set $sin_r macro.tmp 309
execute if score $sin_d macro.tmp matches 19 run scoreboard players set $sin_r macro.tmp 326
execute if score $sin_d macro.tmp matches 20 run scoreboard players set $sin_r macro.tmp 342
execute if score $sin_d macro.tmp matches 21 run scoreboard players set $sin_r macro.tmp 358
execute if score $sin_d macro.tmp matches 22 run scoreboard players set $sin_r macro.tmp 375
execute if score $sin_d macro.tmp matches 23 run scoreboard players set $sin_r macro.tmp 391
execute if score $sin_d macro.tmp matches 24 run scoreboard players set $sin_r macro.tmp 407
execute if score $sin_d macro.tmp matches 25 run scoreboard players set $sin_r macro.tmp 423
execute if score $sin_d macro.tmp matches 26 run scoreboard players set $sin_r macro.tmp 438
execute if score $sin_d macro.tmp matches 27 run scoreboard players set $sin_r macro.tmp 454
execute if score $sin_d macro.tmp matches 28 run scoreboard players set $sin_r macro.tmp 469
execute if score $sin_d macro.tmp matches 29 run scoreboard players set $sin_r macro.tmp 485
execute if score $sin_d macro.tmp matches 30 run scoreboard players set $sin_r macro.tmp 500
execute if score $sin_d macro.tmp matches 31 run scoreboard players set $sin_r macro.tmp 515
execute if score $sin_d macro.tmp matches 32 run scoreboard players set $sin_r macro.tmp 530
execute if score $sin_d macro.tmp matches 33 run scoreboard players set $sin_r macro.tmp 545
execute if score $sin_d macro.tmp matches 34 run scoreboard players set $sin_r macro.tmp 559
execute if score $sin_d macro.tmp matches 35 run scoreboard players set $sin_r macro.tmp 574
execute if score $sin_d macro.tmp matches 36 run scoreboard players set $sin_r macro.tmp 588
execute if score $sin_d macro.tmp matches 37 run scoreboard players set $sin_r macro.tmp 602
execute if score $sin_d macro.tmp matches 38 run scoreboard players set $sin_r macro.tmp 616
execute if score $sin_d macro.tmp matches 39 run scoreboard players set $sin_r macro.tmp 629
execute if score $sin_d macro.tmp matches 40 run scoreboard players set $sin_r macro.tmp 643
execute if score $sin_d macro.tmp matches 41 run scoreboard players set $sin_r macro.tmp 656
execute if score $sin_d macro.tmp matches 42 run scoreboard players set $sin_r macro.tmp 669
execute if score $sin_d macro.tmp matches 43 run scoreboard players set $sin_r macro.tmp 682
execute if score $sin_d macro.tmp matches 44 run scoreboard players set $sin_r macro.tmp 695
execute if score $sin_d macro.tmp matches 45 run scoreboard players set $sin_r macro.tmp 707
execute if score $sin_d macro.tmp matches 46 run scoreboard players set $sin_r macro.tmp 719
execute if score $sin_d macro.tmp matches 47 run scoreboard players set $sin_r macro.tmp 731
execute if score $sin_d macro.tmp matches 48 run scoreboard players set $sin_r macro.tmp 743
execute if score $sin_d macro.tmp matches 49 run scoreboard players set $sin_r macro.tmp 755
execute if score $sin_d macro.tmp matches 50 run scoreboard players set $sin_r macro.tmp 766
execute if score $sin_d macro.tmp matches 51 run scoreboard players set $sin_r macro.tmp 777
execute if score $sin_d macro.tmp matches 52 run scoreboard players set $sin_r macro.tmp 788
execute if score $sin_d macro.tmp matches 53 run scoreboard players set $sin_r macro.tmp 799
execute if score $sin_d macro.tmp matches 54 run scoreboard players set $sin_r macro.tmp 809
execute if score $sin_d macro.tmp matches 55 run scoreboard players set $sin_r macro.tmp 819
execute if score $sin_d macro.tmp matches 56 run scoreboard players set $sin_r macro.tmp 829
execute if score $sin_d macro.tmp matches 57 run scoreboard players set $sin_r macro.tmp 839
execute if score $sin_d macro.tmp matches 58 run scoreboard players set $sin_r macro.tmp 848
execute if score $sin_d macro.tmp matches 59 run scoreboard players set $sin_r macro.tmp 857
execute if score $sin_d macro.tmp matches 60 run scoreboard players set $sin_r macro.tmp 866
execute if score $sin_d macro.tmp matches 61 run scoreboard players set $sin_r macro.tmp 875
execute if score $sin_d macro.tmp matches 62 run scoreboard players set $sin_r macro.tmp 883
execute if score $sin_d macro.tmp matches 63 run scoreboard players set $sin_r macro.tmp 891
execute if score $sin_d macro.tmp matches 64 run scoreboard players set $sin_r macro.tmp 899
execute if score $sin_d macro.tmp matches 65 run scoreboard players set $sin_r macro.tmp 906
execute if score $sin_d macro.tmp matches 66 run scoreboard players set $sin_r macro.tmp 914
execute if score $sin_d macro.tmp matches 67 run scoreboard players set $sin_r macro.tmp 921
execute if score $sin_d macro.tmp matches 68 run scoreboard players set $sin_r macro.tmp 927
execute if score $sin_d macro.tmp matches 69 run scoreboard players set $sin_r macro.tmp 934
execute if score $sin_d macro.tmp matches 70 run scoreboard players set $sin_r macro.tmp 940
execute if score $sin_d macro.tmp matches 71 run scoreboard players set $sin_r macro.tmp 946
execute if score $sin_d macro.tmp matches 72 run scoreboard players set $sin_r macro.tmp 951
execute if score $sin_d macro.tmp matches 73 run scoreboard players set $sin_r macro.tmp 956
execute if score $sin_d macro.tmp matches 74 run scoreboard players set $sin_r macro.tmp 961
execute if score $sin_d macro.tmp matches 75 run scoreboard players set $sin_r macro.tmp 966
execute if score $sin_d macro.tmp matches 76 run scoreboard players set $sin_r macro.tmp 970
execute if score $sin_d macro.tmp matches 77 run scoreboard players set $sin_r macro.tmp 974
execute if score $sin_d macro.tmp matches 78 run scoreboard players set $sin_r macro.tmp 978
execute if score $sin_d macro.tmp matches 79 run scoreboard players set $sin_r macro.tmp 982
execute if score $sin_d macro.tmp matches 80 run scoreboard players set $sin_r macro.tmp 985
execute if score $sin_d macro.tmp matches 81 run scoreboard players set $sin_r macro.tmp 988
execute if score $sin_d macro.tmp matches 82 run scoreboard players set $sin_r macro.tmp 990
execute if score $sin_d macro.tmp matches 83 run scoreboard players set $sin_r macro.tmp 993
execute if score $sin_d macro.tmp matches 84 run scoreboard players set $sin_r macro.tmp 995
execute if score $sin_d macro.tmp matches 85 run scoreboard players set $sin_r macro.tmp 996
execute if score $sin_d macro.tmp matches 86 run scoreboard players set $sin_r macro.tmp 998
execute if score $sin_d macro.tmp matches 87 run scoreboard players set $sin_r macro.tmp 999
execute if score $sin_d macro.tmp matches 88 run scoreboard players set $sin_r macro.tmp 999
execute if score $sin_d macro.tmp matches 89 run scoreboard players set $sin_r macro.tmp 1000
execute if score $sin_d macro.tmp matches 90 run scoreboard players set $sin_r macro.tmp 1000

scoreboard players operation $sin_r macro.tmp *= $sin_nf macro.tmp
execute store result storage macro:output result int 1 run scoreboard players get $sin_r macro.tmp
$tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"math/sin ","color":"aqua"},{"text":"deg=$(deg) ","color":"gray"},{"text":"→ ","color":"#555555"},{"storage":"macro:output","nbt":"result","color":"green"},{"text":"/1000","color":"#555555"}]
