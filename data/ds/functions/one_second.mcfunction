schedule function ds:one_second 1s

function ds:check_others_active

execute if entity @e[tag=DS] run scoreboard players add $timer DS_TIMER 1

scoreboard players operation $timeLeft DS_TIMER = TIME DS_SETTINGS
scoreboard players operation $timeLeft DS_TIMER -= $timer DS_TIMER

execute if score $timeLeft DS_TIMER matches ..0 run function ds:swap
execute if score SHOW_TIMER DS_SETTINGS matches 1.. if score $timeLeft DS_TIMER matches ..10 run tellraw @a[tag=DS] ["",{"text":"Swapping in","color":"aqua"},{"text":" ","bold":true,"color":"aqua"},{"score":{"name":"$timeLeft","objective":"DS_TIMER"},"bold":true,"color":"green"},{"text":" seconds!","color":"green"}]

execute if entity @e[tag=DS_REQUEST] run scoreboard players remove $startTimer DS_TIMER 1
execute if score $startTimer DS_TIMER matches ..0 run tellraw @a[tag=DS_REQUEST] {"text":"No players joined your game in time","color":"aqua"}
execute if score $startTimer DS_TIMER matches ..0 run tag @e remove DS_REQUEST