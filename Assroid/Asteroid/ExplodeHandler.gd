extends Node2D

onready var AsteroidExplosion = preload("res://Assroid/Asteroid/AsteroidExplosion.tscn")
onready var SoundEffect = preload("res://Assroid/SoundEffects/Explode.tscn")

func _on_AsteroidHealth_asteroid_explode(body):
	var should_explode = false
	if body.is_in_group("asteroids"):
		should_explode = get_parent().get_instance_id() < body.get_instance_id()
	else:
		should_explode = (body.name == "Player" 
		or body.is_in_group("projectiles")
		or body.is_in_group("ufos"))
	
	if should_explode:
		var explosion = AsteroidExplosion.instance()
		explosion.position = global_position
		explosion.emitting = true
		get_tree().root.add_child(explosion)
		
		var sound_effect = SoundEffect.instance()
		sound_effect.position = global_position
		get_tree().root.add_child(sound_effect)

	get_parent().queue_free()
