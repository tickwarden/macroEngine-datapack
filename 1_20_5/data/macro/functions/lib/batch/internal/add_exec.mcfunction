# macro:lib/batch/internal/add_exec [MACRO]
# INPUT: $(id)
# func or cmd field existence is checked outside the macro,
# then the relevant append_func / append_cmd is called — prevents undefined $(func/cmd).

$execute unless data storage macro:engine batches.$(id) run return 0

execute if data storage macro:input func run function macro:lib/batch/internal/add_func with storage macro:input
execute if data storage macro:input cmd run function macro:lib/batch/internal/add_cmd with storage macro:input
