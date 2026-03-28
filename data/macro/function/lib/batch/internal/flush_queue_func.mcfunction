# macro:lib/batch/internal/flush_queue_func [MACRO]
# INPUT: $(func), $(delay) — _bfl_cur'dan; func field guaranteed.

$data modify storage macro:engine queue append value {func:"$(func)", delay:$(delay)}
