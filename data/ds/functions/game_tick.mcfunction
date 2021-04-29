execute if score MANHUNT DS_INFO matches 1.. run scoreboard players set @a[tag=hunter] DS_DEATHS 0
execute as @e[tag=DS] run execute if score @s DS_DEATHS matches 1.. run function ds:game_over