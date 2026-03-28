$data modify storage macro:engine schedules.$(key).cmd set value "$(cmd)"
$data modify storage macro:engine schedules.$(key).interval set value $(interval)
$data modify storage macro:engine queue append value {cmd:"$(cmd)", delay:$(interval)}
