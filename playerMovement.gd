extends CharacterBody2D

@export var speed = 400
var canMove = true
var direction : Vector2 = Vector2(0,0)

@onready var sprite = $playersprite

var BearBattle = load("res://bearbattle.tscn")
var FlyBattle = load("res://FlyBattle.tscn")
var WaveBattle = load("res://WaveBattle.tscn")

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	if canMove == true:
		velocity = input_direction * speed
		
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	

func _physics_process(_delta):
	get_input()
	move_and_slide()
	if direction == Vector2(-1,0):
		sprite.play("Run_left")
	elif direction == Vector2(1,0):
		sprite.play("Run_Right")
	elif direction == Vector2(0,1):
		sprite.play("Run_down")
	elif direction == Vector2(0,-1):
		sprite.play("Run_up")
		





func _on_area_2d_body_entered(body: Node2D) -> void:
	print(str(body))

	canMove = false
	velocity = Vector2(0,0)
	
	get_tree().change_scene_to_packed(BearBattle)
	
	


func _on_fly_battle_trigger_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_packed(FlyBattle)


func _on_wave_battle_trigger_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_packed(WaveBattle)
