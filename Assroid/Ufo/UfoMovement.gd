extends KinematicBody2D

const FIELD_OF_VIEW = 300
const SPEED = 200
const ACCELERATION = 5
const FRICTION = 3

var velocity = Vector2.ZERO

onready var player = get_node("../Player")

func _physics_process(_delta):
	if player.position.distance_to(position) < FIELD_OF_VIEW:
		velocity = velocity.move_toward((player.position - position).normalized() * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	move_and_slide(velocity)
