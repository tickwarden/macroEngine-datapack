# ─────────────────────────────────────────────
#  macro:engine/call/execute_validated/run
#  Expands and runs the validated function via macro.
#  Gets $(func) variable from macro:output.inputs storage,
#  uses macro:input storage as the parameter source.
# ─────────────────────────────────────────────

$function $(func) with storage macro:input {}
