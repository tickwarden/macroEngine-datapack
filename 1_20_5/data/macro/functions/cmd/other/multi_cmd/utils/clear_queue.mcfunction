# ─────────────────────────────────────────────────────────────────
# macro:cmd/other/multi_cmd/utils/clear_queue
# Clear the queue
# ─────────────────────────────────────────────────────────────────

data remove storage macro:engine _mcmd_queue
tellraw @a[tag=macro.debug] ["",{"text":"[AME] ","color":"#00AAAA","bold":true},{"text":"multi_cmd/utils/clear ","color":"aqua"},{"text":"✔ queue cleared","color":"yellow"}]
