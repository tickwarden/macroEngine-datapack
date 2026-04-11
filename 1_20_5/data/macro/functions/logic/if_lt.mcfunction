$scoreboard players set $if_a macro.tmp $(a)
$scoreboard players set $if_b macro.tmp $(b)
$execute if score $if_a macro.tmp < $if_b macro.tmp run function $(func)
