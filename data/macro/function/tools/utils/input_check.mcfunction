data modify storage macro:output inputs set from storage macro:input
data modify storage macro:output data set from storage macro:engine

execute unless data storage macro:output data.global{loaded:1b} run return 0

# BUG FIX: engine v2.0.4-pre1 (küçük v) saklar — V2.0.3 değil
execute unless data storage macro:output data.global{version:"v2.0.4-pre1"} run return 0

# --- Tehlikeli komutlar: injection engeli (permission-level 3 / singleplayer uyumsuz) ---
execute if data storage macro:output inputs{func:"macro:cmd/op"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:engine {op:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:input {op:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {op:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/op with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/ban"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:engine {ban:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:input {ban:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {ban:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/ban_ip"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:engine {ban_ip:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:input {ban_ip:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {ban_ip:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/ban_ip with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/pardon"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:engine {pardon:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:input {pardon:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {pardon:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:engine {pardon_ip:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:input {pardon_ip:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {pardon_ip:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/pardon_ip with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/kick"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:engine {kick:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:input {kick:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {kick:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/kick with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/deop"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:engine {deop:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:input {deop:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {deop:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/deop with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/stop"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:engine {stop:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:input {stop:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {stop:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/stop with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/whitelist"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:engine {whitelist:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:input {whitelist:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:output {whitelist:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/whitelist with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:engine {data_remove_block:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:input {data_remove_block:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {data_remove_block:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_block with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:engine {data_remove_entity:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:input {data_remove_entity:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {data_remove_entity:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_entity with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:engine {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:engine {data_remove_storage:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:input {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:input {data_remove_storage:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {data_remove_storage:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {data:{}}"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/data_remove_storage with storage macro:output {inputs:{}}"} run return 0

execute if data storage macro:output inputs{func:"macro:cmd/save-all"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/save-off"} run return 0
execute if data storage macro:output inputs{func:"macro:cmd/save-on"} run return 0

# Hassas storage yollarını manipüle etmeye yönelik genel injection denemelerini engelle
execute if data storage macro:output inputs{func:"with storage macro:engine"} run return 0
execute if data storage macro:output inputs{func:"with storage macro:input"} run return 0
execute if data storage macro:output inputs{func:"with storage macro:output"} run return 0

# Doğrulama başarıyla tamamlandıysa, komutu güvenli bir şekilde yürütme aşamasına geç
#function macro:engine/call/execute_validated

# Geçici verileri temizle (Bellek yönetimi ve güvenlik için)
data remove storage macro:output data
data remove storage macro:output inputs
