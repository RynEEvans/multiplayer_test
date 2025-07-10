class_name PlayerInput extends Node

var input_dir: Vector2 = Vector2.ZERO 
var jump_input:= 0.0

func _physics_process(delta):
		input_dir = Input.get_vector("left", "right", "forward", "backward")
		jump_input = Input.get_action_strength("jump")
