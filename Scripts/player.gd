class_name Player extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@export var _player_input: PlayerInput

func _enter_tree():
	_player_input.set_multiplayer_authority(str(name).to_int())

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if _player_input.jump_input > 0 and is_on_floor():
		velocity.y = JUMP_VELOCITY * _player_input.jump_input

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := _player_input.input_dir
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
