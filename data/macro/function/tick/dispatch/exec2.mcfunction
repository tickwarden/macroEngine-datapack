# AME Tick — Channel Execute  [MACRO]
# Calls fn directly if condition is empty, otherwise checks predicate first.
# Input: $(fn), $(condition)
#
# condition:""                    → always run (no predicate check)
# condition:"macro:is_daytime"   → only run when predicate passes

$execute unless data storage macro:tick_work channel{condition:""} run execute if predicate $(condition) run function $(fn)
