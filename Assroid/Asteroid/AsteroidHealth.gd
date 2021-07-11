extends Node2D

var health = 3

signal asteroid_hit(health)
signal asteroid_explode(body)

func _on_Asteroid_body_entered(body):
	var health_loss = 0
	if body.is_in_group("asteroids"):
		health_loss = 2
	if body.is_in_group("projectiles"):
		health_loss = 1
	
	health -= health_loss
	
	if health_loss > 0:
		emit_signal("asteroid_hit", health)
	
	if health <= 0:
		emit_signal("asteroid_explode", body)
