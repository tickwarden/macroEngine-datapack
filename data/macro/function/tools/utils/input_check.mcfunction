data modify storage macro:output inputs set from storage macro:input
data modify storage macro:output data set from storage macro:engine

# Load Check
execute unless data storage macro:output data.global{loaded:1b} run return 0

# Version Check
execute unless data storage macro:output data.global{version:"V1.0.4"} run return 0

# ───── /op ─────
execute unless data storage macro:output inputs{func:"macro:cmd/op"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:":"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:engine {op:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:input {op:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {op:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {inputs:{}}"} run return 0

# ───── /ban ─────
execute unless data storage macro:output inputs{func:"macro:cmd/ban"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:engine {ban:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:input {ban:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {ban:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {inputs:{}}"} run return 0

# ───── /ban-ip ─────
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:engine {ban_ip:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:input {ban_ip:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {ban_ip:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {inputs:{}}"} run return 0

# ───── /pardon ─────
execute unless data storage macro:output inputs{func:"macro:cmd/pardon"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:engine {pardon:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:input {pardon:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {pardon:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {inputs:{}}"} run return 0

# ───── /pardon-ip ─────
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:engine {pardon_ip:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:input {pardon_ip:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {pardon_ip:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {inputs:{}}"} run return 0

# ───── /kick ─────
execute unless data storage macro:output inputs{func:"macro:cmd/kick"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:engine {kick:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:input {kick:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {kick:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {inputs:{}}"} run return 0

# ───── /deop ─────
execute unless data storage macro:output inputs{func:"macro:cmd/deop"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:engine {deop:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:input {deop:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {deop:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {inputs:{}}"} run return 0

# ───── /stop ─────
execute unless data storage macro:output inputs{func:"macro:cmd/stop"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:engine {stop:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:input {stop:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {stop:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {inputs:{}}"} run return 0

# ───── /data remove (block) ─────
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:engine {data_remove_block:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:input {data_remove_block:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {data_remove_block:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {inputs:{}}"} run return 0

# ───── /data remove (entity) ─────
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:engine {data_remove_entity:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:input {data_remove_entity:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {data_remove_entity:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {inputs:{}}"} run return 0

# ───── /data remove (storage) ─────
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:engine {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:engine {data_remove_storage:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:input {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:input {data_remove_storage:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {data_remove_storage:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {data:{}}"} run return 0
execute unless data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {inputs:{}}"} run return 0

# Temizle
data remove storage macro:output data
data remove storage macro:output inputs