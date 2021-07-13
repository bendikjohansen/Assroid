extends Node2D

onready var SoundEffect = preload("res://Assroid/SoundEffects/Explode.tscn")
onready var player = get_parent()
var health = 3

signal player_died

func _ready():
	add_to_group("health")

func _on_Projectile_hit(body, _projectile):
	if body == player:
		lose_health(1)

func _on_Asteroid_body_entered(body):
	if body == player:
		lose_health(1)

func lose_health(points):
	health -= points
	
	if health <= 0:
		var sound_effect = SoundEffect.instance()
		sound_effect.position = position
		get_tree().root.add_child(sound_effect)
		emit_signal("player_died")
		player.queue_free()
