# ─────────────────────────────────────────────────────────────────
#  macro:flag/get_or_default
#  Returns 1b if the flag is set, otherwise stores the given default.
#  Input : $(key)     → flag key
#          $(default) → value to store if flag is absent (0b or 1b)
#  Output: macro:output result → 1b if set, $(default) if absent
#
#  Example:
#    data modify storage macro:input key     set value "my_feature"
#    data modify storage macro:input default set value 0b
#    function macro:flag/get_or_default with storage macro:input {}
#    # macro:output result = 0b  (if flag not set)
# ─────────────────────────────────────────────────────────────────

$data modify storage macro:output result set value $(default)
$execute if data storage macro:engine flags.$(key) run data modify storage macro:output result set value 1b
$tellraw @a[tag=macro.debug] {"text":"","extra":[{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"flag/get_or_default ","color":"aqua"},{"text":"$(key) → ","color":"gray"},{"storage":"macro:output","nbt":"result","color":"green"}]}
