effect give @a[tag=DS] levitation 1 255 true

scoreboard players set $timer DS_TIMER 0
scoreboard players set $timeLeft DS_TIMER 5000

tellraw @a[tag=DS] {"text":"Swapping!","bold":true,"color":"green"}
scoreboard players add Swaps DS_INFO 1

execute as @e[tag=DS_P1,limit=1] at @s run execute store success score $forceload DS_FORCELOAD run forceload query ~ ~
execute as @e[tag=DS_P1,limit=1] at @s run forceload add ~ ~
execute as @e[tag=DS_P1,limit=1] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["DS_P1_STAND"],Marker:1b,Invisible:1b}

execute as @e[tag=DS_P1,limit=1] run tp @s @e[tag=DS_P2,limit=1]
execute as @e[tag=DS_P2,limit=1] run tp @s @e[tag=DS_P1_STAND,limit=1]

execute as @e[tag=DS_P1_STAND] at @s unless score $forceload DS_FORCELOAD matches 1.. run forceload remove ~ ~
execute as @e[tag=DS_P1_STAND] at @s run kill @s