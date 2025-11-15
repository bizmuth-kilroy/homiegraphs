extends Control

@onready var AttackButton = $HBoxContainer/AttackButton
@onready var SwitchOutButton = $HBoxContainer/SwitchOutButton
@onready var FleeButton = $HBoxContainer/FleeButton


func _ready():
	AttackButton.pressed.connect(_Attack)
	SwitchOutButton.pressed.connect(_SwitchOut)
	FleeButton.pressed.connect(_Flee)

func _Attack():
	print("Attacking")

func _SwitchOut():
	print("Switch out, now!")

func _Flee():
	print("Fleeing!")
