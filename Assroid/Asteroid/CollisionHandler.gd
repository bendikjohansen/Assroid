extends Node2D

onready var AsteroidExplosion = preload("res://Assroid/Asteroid/AsteroidExplosion.tscn")

func _on_Asteroid_asteroid_explode(body):
	var spawned_first = get_parent().get_instance_id() < body.get_instance_id()
	if body.name == "Player" or spawned_first:
		var explosion = AsteroidExplosion.instance()
		explosion.position = global_position
		explosion.emitting = true
		get_tree().root.add_child(explosion)

	get_parent().queue_free()
