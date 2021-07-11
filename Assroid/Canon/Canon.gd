extends Node2D

onready var Projectile = preload("res://Assroid/Projectile/Projectile.tscn")

func shoot(direction: Vector2):
	var projectile = Projectile.instance()
	projectile.global_position = global_position
	projectile.direction = direction
	get_tree().root.add_child(projectile)
