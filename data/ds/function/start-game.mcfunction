time set 0
weather clear

execute if score DAY_ONLY DS_SETTINGS matches 1.. run gamerule doDaylightCycle false
execute if score DAY_ONLY DS_SETTINGS matches 1.. run gamerule doWeatherCycle false

scoreboard players reset @a DS_JOIN

scoreboard players reset * DS_INFO

scoreboard objectives setdisplay sidebar DS_INFO
scoreboard players set --------- DS_INFO 9999
scoreboard players set Swaps DS_INFO 0

scoreboard players set @a DS_DEATHS 0

execute if score tbm_manhunt activeDatapacks matches 1.. run scoreboard players enable @a[tag=DS_REQUEST] DS_MANHUNT
execute if score tbm_manhunt activeDatapacks matches 1.. run tellraw @a[tag=DS_REQUEST] ["",{"text":"Manhunt ","bold":true,"color":"green"},{"text":"datapack detected! You can turn on ","color":"aqua"},{"text":"manhunt ","bold":true,"color":"green"},{"text":"compatibility by clicking","color":"aqua"},{"text":" ","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger DS_MANHUNT set 1"}},{"text":"[HERE]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger DS_MANHUNT set 1"}}]

tag @e[tag=DS_REQUEST] add DS_P1
tag @e remove DS_REQUEST

tag @e[tag=p_DS_P2] add DS_P2
tag @e remove p_DS_P2

tp @e[tag=DS_P2] @e[tag=DS_P1,limit=1]

tag @e[tag=DS_P1] add DS
tag @e[tag=DS_P2] add DS

execute if score SPREAD_PLAYERS DS_SETTINGS matches 1.. run spreadplayers ~ ~ 10000 10000 false @e[tag=DS]

clear @a[tag=DS]
xp set @a[tag=DS] 0 levels
xp set @a[tag=DS] 0 points
advancement revoke @a[tag=DS] everything
effect clear @a[tag=DS]
give @a[tag=DS] minecraft:water_bucket
gamemode survival @a[tag=DS]

effect give @a[tag=DS] regeneration 10 255 true
effect give @a[tag=DS] saturation 10 255 true

tellraw @a[tag=DS] ["",{"text":"DeathSwap ","bold":true,"color":"green"},{"text":"started!","bold":true,"color":"aqua"},{"text":"\n\n"},{"text":"Players: ","color":"aqua"},{"selector":"@a[tag=DS]","color":"aqua"}]