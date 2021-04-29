execute unless entity @e[tag=DS] unless entity @e[tag=DS_REQUEST] run scoreboard players enable @a DS_START_GAME
execute if entity @e[tag=DS] if entity @e[tag=DS_REQUEST] run execute as @a run trigger DS_START_GAME add 0

execute as @a[tag=!DS] run trigger DS_MANHUNT add 0
execute as @a[tag=DS,scores={DS_MANHUNT=1..}] run scoreboard players set MANHUNT DS_INFO 1
execute as @a[tag=DS,scores={DS_MANHUNT=1..},limit=1] unless entity @e[tag=manhunt] run function manhunt:request-game
scoreboard players set @a DS_MANHUNT 0

execute as @a[scores={DS_START_GAME=1..}] unless entity @e[tag=DS] unless entity @e[tag=DS_REQUEST] run function ds:request-game
execute as @a[scores={DS_START_GAME=1..}] if entity @e[tag=DS] if entity @e[tag=DS_REQUEST] run tellraw @s ["",{"text":"A game of ","bold":true,"color":"aqua"},{"text":"DeathSwap ","bold":true,"color":"green"},{"text":"is already in progress.","bold":true,"color":"aqua"}]
scoreboard players set @a DS_START_GAME 0

tag @e[tag=DS_P1] add DS
tag @e[tag=DS_P2] add DS

execute if entity @e[tag=DS] run function ds:game_tick

execute if entity @e[tag=DS_REQUEST] run scoreboard players enable @a[tag=!DS_REQUEST] DS_JOIN
execute if entity @e[tag=DS_REQUEST] run tellraw @a[tag=!DS_REQUEST] ["\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",{"selector":"@e[tag=DS_REQUEST,limit=1] ","bold":true,"color":"green"},{"text":"is requesting a game of ","color":"aqua"},{"text":"DeathSwap","bold":true,"color":"green"},{"text":"!","color":"aqua"},{"text":"\n"},{"text":"You can join in by clicking ","color":"aqua"},{"text":"[HERE]","bold":true,"color":"green","clickEvent":{"action":"run_command","value":"/trigger DS_JOIN set 1"}}]
execute if entity @e[tag=DS_REQUEST] run title @a actionbar ["",{"selector":"@a[tag=DS_REQUEST,limit=1]","bold":true,"color":"green"},{"text":" is requesting a game of ","color":"aqua"},{"text":"DeathSwap","bold":true,"color":"green"},{"text":"! ","color":"aqua"},{"score":{"name":"$startTimer","objective":"DS_TIMER"},"bold":true,"color":"green"},{"text":" seconds left.","color":"aqua"}]
execute as @a[scores={DS_JOIN=1..}] run tag @s add p_DS_P2
execute as @a[scores={DS_JOIN=1..}] run execute as @e[tag=DS_REQUEST,limit=1] at @s run function ds:start-game
execute unless entity @e[tag=DS_REQUEST] run execute as @a run trigger DS_JOIN add 0

scoreboard players enable @a Settings_DS
execute as @a[scores={Settings_DS=1..}] run function ds:settings
scoreboard players set @a Settings_DS 0