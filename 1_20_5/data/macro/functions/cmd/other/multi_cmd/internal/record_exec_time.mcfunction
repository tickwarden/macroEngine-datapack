# Record execution time for profiling
execute store result score $mcmd_exec_end macro.tmp run time query gametime
scoreboard players operation $mcmd_exec_dur macro.tmp = $mcmd_exec_end macro.tmp
scoreboard players operation $mcmd_exec_dur macro.tmp -= $mcmd_exec_start macro.tmp

scoreboard players reset $mcmd_exec_start macro.tmp
scoreboard players reset $mcmd_exec_end macro.tmp
scoreboard players reset $mcmd_exec_dur macro.tmp
