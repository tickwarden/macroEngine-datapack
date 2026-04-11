data modify storage macro:engine pb_obj set value "health"
data modify storage macro:engine pb_max set value 20
data modify storage macro:engine pb_label set value "Health"

execute if data storage macro:input pb_obj run data modify storage macro:engine pb_obj set from storage macro:input pb_obj
execute if data storage macro:input max run data modify storage macro:engine pb_max set from storage macro:input max
execute if data storage macro:input label run data modify storage macro:engine pb_label set from storage macro:input label
