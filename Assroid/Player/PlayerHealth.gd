extends Node2D

onready var player = get_parent()
var health = 3

func _ready():
	add_to_group("health")

func _on_Projectile_body_entered(body):
	if body == player:
		lose_health(1)

func _on_Asteroid_body_entered(body):
	if body == player:
		lose_health(1)
		
func lose_health(points):
	health -= points
	
	if health <= 0:
		player.queue_free()