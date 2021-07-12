extends KinematicBody2D

const SPEED = 200
const ACCELERATION = 5
const FRICTION = 5
const PREFERRED_DISTANCE_TO_PLAYER = 150
var is_chasing = false

var velocity = Vector2.ZERO

func _ready():
	add_to_group("ufos")

func _physics_process(_delta):
	if not is_chasing:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	
	move_and_slide(velocity)

func _on_UfoSight_player_sighted(player_position, distance_to_player):
	if distance_to_player < PREFERRED_DISTANCE_TO_PLAYER:
		is_chasing = false
	else:
		is_chasing = true
		velocity = velocity.move_toward((player_position - position).normalized() * SPEED, ACCELERATION)

func _on_UfoSight_player_escaped():
	is_chasing = false
