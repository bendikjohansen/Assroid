extends RigidBody2D

const SPEED = 100
var velocity = Vector2.RIGHT.rotated(randf() * 2 * PI) * SPEED

signal asteroid_explode

func _ready():
	add_to_group("asteroids")

func _physics_process(delta):
	linear_velocity = velocity

func _on_Asteroid_body_entered(body):
	var should_explode = body.is_in_group("asteroids") or body.name == "Player"
	if should_explode:
		emit_signal("asteroid_explode", body)
