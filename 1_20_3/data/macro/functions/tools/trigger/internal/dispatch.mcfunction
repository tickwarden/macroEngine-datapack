# macro:tools/trigger/internal/dispatch
# Calls macro:cmd/* based on tools_trigger.type.
# All calls use "with storage macro:engine tools_trigger.data".

# ── Message ──────────────────────────────────────────────────────────────────
# type:"msg" → data:{player:"Name", message:"..."}
execute if data storage macro:engine tools_trigger{type:"msg"} run function macro:cmd/msg with storage macro:engine tools_trigger.data

# type:"title" → data:{player:"Name", text:"...", color:"gold"}
execute if data storage macro:engine tools_trigger{type:"title"} run function macro:cmd/title with storage macro:engine tools_trigger.data

# type:"subtitle" → data:{player:"Name", text:"...", color:"white"}
execute if data storage macro:engine tools_trigger{type:"subtitle"} run function macro:cmd/subtitle with storage macro:engine tools_trigger.data

# type:"actionbar" → data:{player:"Name", text:"...", color:"aqua"}
execute if data storage macro:engine tools_trigger{type:"actionbar"} run function macro:cmd/actionbar with storage macro:engine tools_trigger.data

# type:"title_times"→ data:{player:"Name", in:10, stay:70, out:20}
execute if data storage macro:engine tools_trigger{type:"title_times"} run function macro:cmd/title_times with storage macro:engine tools_trigger.data

# type:"title_clear"→ data:{player:"Name"}
execute if data storage macro:engine tools_trigger{type:"title_clear"} run function macro:cmd/title_clear with storage macro:engine tools_trigger.data

# type:"title_reset"→ data:{player:"Name"}
execute if data storage macro:engine tools_trigger{type:"title_reset"} run function macro:cmd/title_reset with storage macro:engine tools_trigger.data

# ── Sound & Particles ──────────────────────────────────────────────────────
# type:"sound" → data:{player:"Name", sound:"minecraft:...", volume:1, pitch:1}
execute if data storage macro:engine tools_trigger{type:"sound"} run function macro:cmd/sound with storage macro:engine tools_trigger.data

# ── Efekt ─────────────────────────────────────────────────────────────────
# type:"effect_add" → data:{player:"Name", effect:"minecraft:speed", duration:100, amplifier:1}
execute if data storage macro:engine tools_trigger{type:"effect_add"} run function macro:cmd/effect_give with storage macro:engine tools_trigger.data

# type:"effect_clear"→ data:{player:"Name"}
execute if data storage macro:engine tools_trigger{type:"effect_clear"} run function macro:cmd/effect_clear with storage macro:engine tools_trigger.data

# ── Item ──────────────────────────────────────────────────────────────────
# type:"give" → data:{player:"Name", item:"minecraft:diamond", count:1}
execute if data storage macro:engine tools_trigger{type:"give"} run function macro:cmd/give with storage macro:engine tools_trigger.data

# ── XP ────────────────────────────────────────────────────────────────────
# type:"xp" → data:{player:"Name", amount:100, type:"points"} (type: points|levels)
execute if data storage macro:engine tools_trigger{type:"xp"} run function macro:cmd/xp_add with storage macro:engine tools_trigger.data

# ── Oyuncu ────────────────────────────────────────────────────────────────
# type:"gamemode" → data:{player:"Name", mode:"survival"}
execute if data storage macro:engine tools_trigger{type:"gamemode"} run function macro:cmd/gamemode with storage macro:engine tools_trigger.data

# type:"kick" → data:{player:"Name"}
execute if data storage macro:engine tools_trigger{type:"kick"} run function macro:cmd/kick with storage macro:engine tools_trigger.data

# type:"tp" → data:{player:"Name", x:0, y:64, z:0}
execute if data storage macro:engine tools_trigger{type:"tp"} run function macro:cmd/tp_to_coords with storage macro:engine tools_trigger.data

# ── Scoreboard ────────────────────────────────────────────────────────────
# type:"score_set" → data:{player:"Name", objective:"obj", value:10}
execute if data storage macro:engine tools_trigger{type:"score_set"} run function macro:cmd/scoreboard_set with storage macro:engine tools_trigger.data

# type:"score_add" → data:{player:"Name", objective:"obj", amount:5}
execute if data storage macro:engine tools_trigger{type:"score_add"} run function macro:cmd/scoreboard_add with storage macro:engine tools_trigger.data

# ── Tag ───────────────────────────────────────────────────────────────────
# type:"tag_add" → data:{player:"Name", tag:"myTag"}
execute if data storage macro:engine tools_trigger{type:"tag_add"} run function macro:cmd/tag_add with storage macro:engine tools_trigger.data

# type:"tag_remove" → data:{player:"Name", tag:"myTag"}
execute if data storage macro:engine tools_trigger{type:"tag_remove"} run function macro:cmd/tag_remove with storage macro:engine tools_trigger.data

# ── World ─────────────────────────────────────────────────────────────────
# type:"fill" → data:{x1:..,y1:..,z1:..,x2:..,y2:..,z2:..,block:"minecraft:stone"}
execute if data storage macro:engine tools_trigger{type:"fill"} run function macro:cmd/fill with storage macro:engine tools_trigger.data

# type:"setblock" → data:{x:..,y:..,z:..,block:"minecraft:stone"}
execute if data storage macro:engine tools_trigger{type:"setblock"} run function macro:cmd/setblock with storage macro:engine tools_trigger.data

# ── Fonksiyon & Komut ─────────────────────────────────────────────────────
# NOTE: delay / schedule_cancel intentionally excluded here.
# The schedule command runs at op-level; allowing arbitrary function scheduling.
# Use macro:lib/schedule directly and explicitly if needed.
# type:"func" → data:{ns:"namespace", path:"func/path"}
execute if data storage macro:engine tools_trigger{type:"func"} run function macro:tools/trigger/internal/exec_func with storage macro:engine tools_trigger.data

# type:"cmd" → data:{cmd:"say hello"}
execute if data storage macro:engine tools_trigger{type:"cmd"} run function macro:tools/trigger/internal/exec_cmd with storage macro:engine tools_trigger.data

# type:"multi1" → data:{list:[],options:{}}
execute if data storage macro:engine tools_trigger{type:"multi1"} run function macro:cmd/other/multi_cmd_adv with storage macro:engine tools_trigger.data

# type:"multi2" → data:{commands:[]}
execute if data storage macro:engine tools_trigger{type:"multi2"} run function macro:cmd/other/multi_cmd with storage macro:engine tools_trigger.data
