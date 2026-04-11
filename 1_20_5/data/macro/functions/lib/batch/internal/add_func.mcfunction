# macro:lib/batch/internal/add_func [MACRO]
# INPUT: $(id), $(func)
# Called with func field guaranteed.

$data modify storage macro:engine batches.$(id).items append value {func:"$(func)"}
