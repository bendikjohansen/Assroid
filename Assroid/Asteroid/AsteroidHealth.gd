extends Node2D

var health = 3

signal asteroid_explode(body)

func _on_Asteroid_body_entered(body):
	if body.is_in_group("asteroids"):
		health -= 2
	if body.is_in_group("projectiles"):
		health -= 1
	
	if health <= 0:
		emit_signal("asteroid_explode", body)
