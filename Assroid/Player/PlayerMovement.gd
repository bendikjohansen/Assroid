extends KinematicBody2D

onready var initial_position = position

const STRAFE_SPEED = 10
const MAX_SPEED = 300
const ACCELERATION = 5
const FRICTION = 1
var velocity = Vector2.ZERO

func _physics_process(_delta):
	var has_thrust = false
	if Input.is_action_pressed("thrust"):
		has_thrust = true
		var max_velocity = Vector2.UP.rotated(rotation + PI / 2) * MAX_SPEED
		velocity = velocity.move_toward(max_velocity, ACCELERATION)
	
	if Input.is_action_pressed("strafe_left"):
		has_thrust = true
		velocity = velocity + Vector2.LEFT * STRAFE_SPEED
		
	if Input.is_action_pressed("strafe_right"):
		has_thrust = true
		velocity = velocity + Vector2.RIGHT * STRAFE_SPEED
		
	if not has_thrust:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	velocity = velocity.clamped(MAX_SPEED)
	velocity = move_and_slide(velocity)

func _input(event):
	if event is InputEventMouseMotion:
		look_at(event.position + position - initial_position)
