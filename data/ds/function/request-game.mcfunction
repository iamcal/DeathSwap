tag @s add DS_REQUEST
scoreboard players operation $startTimer DS_TIMER = START_TIMER DS_SETTINGS

tellraw @s ["",{"text":"A game of ","color":"aqua"},{"text":"DeathSwap ","bold":true,"color":"green"},{"text":"requested, waiting for players","color":"aqua"}]