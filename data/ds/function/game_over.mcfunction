tellraw @a[tag=DS] {"text":"Game over!","bold":true,"color":"green"}

scoreboard objectives setdisplay sidebar

title @a[tag=DS] title ["",{"selector":"@e[tag=DS,scores={DS_DEATHS=..1},limit=1]","bold":true,"color":"green"},{"text":" wins!","color":"aqua"}]

scoreboard players set $timer DS_TIMER 0

tag @e remove DS_P1
tag @e remove DS_P2
tag @e remove DS