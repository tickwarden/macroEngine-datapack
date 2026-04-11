# macro:lib/batch/internal/add_cmd [MACRO]
# INPUT: $(id), $(cmd)
# Called with cmd field guaranteed.

$data modify storage macro:engine batches.$(id).items append value {cmd:"$(cmd)"}
