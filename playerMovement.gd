extends CharacterBody2D

@export var speed = 400
var canMove = true

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	if canMove == true:
		velocity = input_direction * speed
	

func _physics_process(delta):
	get_input()
	move_and_slide()

# Player in contact with enemy
func _on_area_2d_body_entered(body: Node2D) -> void:
	canMove = false
	velocity = Vector2(0,0)
	# Trigger switch to combat scene

# Handler for player returns to the overworld


# Handler for player leaves the overworld
