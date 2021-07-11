extends KinematicBody2D

const SPEED = 400

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
	rotation = direction.angle()
	velocity = direction.normalized() * SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
