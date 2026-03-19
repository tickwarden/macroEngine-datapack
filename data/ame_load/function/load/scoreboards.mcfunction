scoreboard objectives add macro.tmp dummy
scoreboard objectives add macro.time dummy
scoreboard objectives add macro_menu trigger
scoreboard objectives add macro_run trigger
scoreboard objectives add macro_action trigger
scoreboard objectives add macro.dialog_load dummy
scoreboard objectives add macro.tick_guard dummy
scoreboard objectives add health health {"text":"❤","color":"red"}
scoreboard objectives add ame.pre_version dummy
scoreboard objectives add macro.pid dummy

scoreboard objectives add macro.Flags dummy {"text":"Macro Flags","color":"gold"}

scoreboard players set #m_time macro.Flags 1
scoreboard players set #m_queue macro.Flags 1
scoreboard players set #m_player macro.Flags 1
scoreboard players set #m_hud macro.Flags 1
scoreboard players set #m_admin macro.Flags 1

# Wand modülü — carrot_on_a_stick sağ-tık tracker
scoreboard objectives add macro.rightClick minecraft.used:minecraft.carrot_on_a_stick
