extends Control

var minigame_active = false
var plrchoice = 0
var isPlayerAlive = true
var isEnemyAlive = true
var enemyhlth = 10
var plrhlth = 10
@onready var defenseminigame = $DefenseMinigame
@onready var attackminigame = $AttackMinigame
var safari = load("res://safari.tscn")
var mainmenu = load("res://homescreen.tscn")
@onready var timer = $MinigameTimer
@onready var animator = $AnimationPlayer
var selected = false
var fleeing = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	defenseminigame.visible = false
	attackminigame.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if plrhlth <= 0:
		isPlayerAlive = false
	if enemyhlth <= 0:
		isEnemyAlive = false
	#print(isPlayerAlive)


func _on_attack_button_pressed():
	#play fight minigame
	if selected == false:
		_attack_minigame()
	#defense minigame
	
	pass # Replace with function body.


func _on_switch_button_pressed():
	#switch monster
	
	#Defense minigame
	if selected == false:
		_defense_minigame()
	
	
	pass # Replace with function body.


func _on_flee_button_pressed():
	#play defense minigame
	
	#if success, end battle
	
	plrchoice = 3
	fleeing = true
	_defense_minigame()
	pass # Replace with function body.


func _defense_minigame():
	print("defend!")
	plrchoice = 2
	defenseminigame.visible = true
	selected = true
	timer.start()
	print("timer started")
	
	animator.play("Bearclawatk1")
	

func _attack_minigame():
	print("attack")
	plrchoice = 1
	#attackminigame.visible = true
	selected = true
	timer.start()
	animator.play("bearhit")
	enemyhlth -= 2
	

func _on_minigame_timer_timeout():
	timer.stop()
	
	if plrchoice == 1:
		attackminigame.visible = false
		_defense_minigame()
	elif plrchoice == 2:
		defenseminigame.visible = false

	elif plrchoice == 3:
		get_tree().change_scene_to_packed(safari)
		
	if fleeing == true:
		get_tree().change_scene_to_packed(safari)
	
	checkStatus(isPlayerAlive, isEnemyAlive)
	selected = false
	
	
	



# Checks the conditions of both alive, player died, enemy died, or both 
func checkStatus(isPLayerAlive: bool, isEnemyAlive: bool) -> void:
	if ((isEnemyAlive == true) && (isPlayerAlive == true)): # returns "both" meaning continue battle process
		print("both") # this means both are alive
	elif ((isEnemyAlive == false) && (isPlayerAlive == true)): # returns "player" meaning player is alive but enemy died
		print("winner")
		get_tree().change_scene_to_packed(safari)
	elif ((isEnemyAlive == true) && (isPlayerAlive == false)): # returns "enemy" meaning enemy is alive but player is not
		print("enemy")
		get_tree().change_scene_to_packed(mainmenu)
	else:
		print("Something went wrong....? I think?")
		


func _on_hitbox_area_entered(area: Area2D):
	plrhlth -= 2
