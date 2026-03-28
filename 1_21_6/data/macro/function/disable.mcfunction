playsound minecraft:block.note_block.pling master @s ~ ~ ~ 4 2

function macro:disable/main

tellraw @s [{"text":"To restart:"}," ",{"text":"Click!","click_event":{"action":"run_command","command":"/function macro:load"},"color":"aqua","bold":true,"italic":false}]
