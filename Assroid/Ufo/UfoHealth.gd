extends Node2D

onready var SoundEffect = preload("res://Assroid/SoundEffects/Explode.tscn")
onready var ufo = get_parent()

func _ready():
	add_to_group('health')
	
	for member in get_tree().get_nodes_in_group("projectiles"):
		member.connect("body_entered", self, "_on_Projectile_body_entered")

func _on_Asteroid_body_entered():
	pass

func _on_Projectile_body_entered(body):
	if body == ufo:
		var sound_effect = SoundEffect.instance()
		sound_effect.position = position
		get_tree().root.add_child(sound_effect)
		ufo.queue_free()
