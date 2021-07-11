extends RigidBody2D

const SPEED = 100
var velocity = Vector2.RIGHT.rotated(randf() * 2 * PI) * SPEED

var ROTATION = rand_range(-100, 100)

func _ready():
	add_to_group("asteroids")
	apply_impulse(Vector2.ZERO, velocity)
	add_torque(ROTATION)
