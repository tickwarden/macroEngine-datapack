# macro:wand/internal/fire [MACRO]
# Run the bind based on func or cmd field.

execute if data storage macro:engine _wand_current.func run function macro:wand/internal/call_func with storage macro:engine _wand_current
execute if data storage macro:engine _wand_current.cmd run function macro:wand/internal/call_cmd with storage macro:engine _wand_current
