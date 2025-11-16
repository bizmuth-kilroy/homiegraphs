extends Node
# Global var to be changed by other scripts if needed
var isPlayerAlive = true
# Function should be called whenever you enter a battle
func inBattle(enemyHp: int, enemyDmg: int) -> void: 
	var isEnemyAlive = true
	var playerHp = 17

# Checks the conditions of both alive, player died, enemy died, or both 
func checkStatus(isPLayerAlive: bool, isEnemyAlive: bool) -> String:
	if ((isEnemyAlive == true) && (isPlayerAlive == true)): # returns "both" meaning continue battle process
		return "both" # this means both are alive
	elif ((isEnemyAlive == false) && (isPlayerAlive == true)): # returns "player" meaning player is alive but enemy died
		return "player"
	elif ((isEnemyAlive == true) && (isPlayerAlive == false)): # returns "enemy" meaning enemy is alive but player is not
		return "enemy"
	else:
		print("Something went wrong....? I think?")
		return "error"
