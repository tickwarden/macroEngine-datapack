# macro:hook/on_interact_shulker_box
# Advancement reward: runs when player opens a shulker box
advancement revoke @s only macro:hook/interact_shulker_box
function macro:hook/internal/on_interact_shulker_box
