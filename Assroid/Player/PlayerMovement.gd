extends KinematicBody2D

onready var initial_position = position

const MAX_SPEED = 200
const ACCELERATION = 5
const FRICTION = 1
var velocity = Vector2.ZERO

const MAX_ROTATION_SPEED = 200
const ROTATION_ACCELERATION = 5
const ROTATION_FRICTION = 1
var rotation_velocity = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		var max_velocity = Vector2.UP.rotated(rotation + PI / 2) * MAX_SPEED
		velocity = velocity.move_toward(max_velocity, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	velocity = move_and_slide(velocity)

func _input(event):
	if event is InputEventMouseMotion:
		look_at(event.position + position - initial_position)
