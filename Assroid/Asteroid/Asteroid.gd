extends RigidBody2D

const SPEED = 100
var velocity = Vector2.RIGHT.rotated(randf() * 2 * PI) * SPEED

var ROTATION = rand_range(-100, 100)

signal asteroid_explode

func _ready():
	add_to_group("asteroids")
	apply_impulse(Vector2.ZERO, velocity)
	add_torque(ROTATION)

func _on_Asteroid_body_entered(body):
	var should_explode = body.is_in_group("asteroids") or body.name == "Player"
	if should_explode:
		emit_signal("asteroid_explode", body)
