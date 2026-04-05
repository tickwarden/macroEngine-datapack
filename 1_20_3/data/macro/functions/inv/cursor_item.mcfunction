# 1.20.3 does not have a real player.cursor slot; this fallback checks the held item.
$execute as @a at @s if entity @s[nbt={SelectedItem:{tag:$(customData)}}] run $(invoke)
