extends Node2D

var health = 3
onready var player = get_node("/root/Game/WorldEnvironment/Player")
onready var score = get_node("/root/Game/WorldEnvironment/CanvasLayer/Score")

signal asteroid_hit(health)
signal asteroid_explode(body)
signal asteroid_exploded_by_player

func _ready():
	connect("asteroid_exploded_by_player", score, "_on_Asteroid_asteroid_exploded_by_player")

func _on_Projectile_hit(_body, _projectile):
	pass

func _on_Asteroid_body_entered(body):
	var health_loss = 0
	if body.is_in_group("asteroids"):
		health_loss = 2
	if body.is_in_group("projectiles"):
		health_loss = 1
	if body.is_in_group("ufos"):
		health_loss = 3
	
	health -= health_loss
	
	if health_loss > 0:
		emit_signal("asteroid_hit", health)
	
	if health <= 0:
		emit_signal("asteroid_explode", body)
		
		if body.is_in_group("projectiles") and body.shooter == player:
			emit_signal("asteroid_exploded_by_player")
