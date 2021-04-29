tellraw @a ["",{"text":"DeathSwap ","bold":true,"color":"green"},{"text":"by TriLinder has been loaded.","color":"aqua"}]

scoreboard objectives add DS_DEATHS deathCount
scoreboard objectives add DS_TIMER dummy
scoreboard objectives add DS_SETTINGS dummy "DeathSwap Settings"
scoreboard objectives add DS_START_GAME trigger
scoreboard objectives add DS_JOIN trigger
scoreboard objectives add DS_INFO dummy "Game Info"
scoreboard objectives add Settings_DS trigger
scoreboard objectives add DS_MANHUNT trigger
scoreboard objectives add DS_FORCELOAD dummy

execute unless score --------- DS_SETTINGS matches 9999 run function ds:reset_settings

function ds:one_second