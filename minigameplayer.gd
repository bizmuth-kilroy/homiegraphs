extends CharacterBody2D


@onready var node = $".."
@export var speed = 400
var canMove = false

func get_input():
	
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	if canMove == true:
		velocity = input_direction * speed
		
	

func _physics_process(_delta):
	if node.visible == true:
		canMove = true
	else:
		canMove = false
	get_input()
	move_and_slide()
