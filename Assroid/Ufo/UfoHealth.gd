extends Node2D

onready var ufo = get_parent()
var health = 1

func _ready():
	add_to_group('health')
	
	for member in get_tree().get_nodes_in_group("projectiles"):
		member.connect("body_entered", self, "_on_Projectile_body_entered")

func _on_Projectile_body_entered(body):
	if body == ufo:
		ufo.queue_free()
