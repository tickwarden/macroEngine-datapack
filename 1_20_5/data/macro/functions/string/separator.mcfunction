# ─────────────────────────────────────────────────────────────────
# macro:string/separator
# Sends a decorative horizontal separator line.
#  Input : $(target) → selector
#          $(color)  → line color (e.g. "gray", "aqua", "#555555")
#          $(label)  → optional center label (use "" for plain line)
#
# Example (plain line):
# data modify storage macro:input target set value "@s"
# data modify storage macro:input color set value "gray"
# data modify storage macro:input label set value ""
# function macro:string/separator with storage macro:input {}
#
# Example (labeled):
# data modify storage macro:input label set value " Settings "
# function macro:string/separator with storage macro:input {}
# ─────────────────────────────────────────────────────────────────

$tellraw $(target) {"text":"","extra":[{"text":"──────────","color":"$(color)"},{"text":"$(label)","color":"$(color)","bold":true},{"text":"──────────","color":"$(color)"}]}
