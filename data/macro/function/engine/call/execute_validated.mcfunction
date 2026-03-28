# ─────────────────────────────────────────────
#  macro:engine/call/execute_validated
#  Runs a function that has passed security validation.
#  Called only by macro:tools/utils/input_check.
#
#  Girdi (macro:output.inputs):
#    func  — function name to run (already validated)
#  Veri   (macro:input):
#    All parameters to pass to the function
# ─────────────────────────────────────────────

# Pass validated func name to macro sub-function and run
function macro:engine/call/execute_validated/run with storage macro:output inputs
