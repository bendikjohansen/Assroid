extends Node2D

onready var SoundEffect = preload("res://Assroid/SoundEffects/Explode.tscn")
onready var ufo = get_parent()
onready var player = get_node("/root/Game/WorldEnvironment/Player")
onready var score = get_node("/root/Game/WorldEnvironment/CanvasLayer/Score")

signal ufo_killed_by_player()

func _ready():
	add_to_group('health')
	
	for member in get_tree().get_nodes_in_group("projectiles"):
		member.connect("hit", self, "_on_Projectile_hit")
		
	connect("ufo_killed_by_player", score, "_on_Ufo_ufo_killed_by_player")

func _on_Asteroid_body_entered(_body):
	pass

func _on_Projectile_body_entered(body):
	pass

func _on_Projectile_hit(body, projectile):
	if body == ufo:
		var sound_effect = SoundEffect.instance()
		sound_effect.position = position
		get_tree().root.add_child(sound_effect)
		ufo.queue_free()
		
		if projectile.shooter == player:
			emit_signal('ufo_killed_by_player')
