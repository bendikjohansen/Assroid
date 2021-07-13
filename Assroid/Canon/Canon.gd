extends Node2D

onready var entities = get_node("/root/Game/WorldEnvironment/Entities")
onready var Projectile = preload("res://Assroid/Projectile/Projectile.tscn")

func shoot(direction: Vector2, projectile_color: Color):
	var projectile = Projectile.instance()
	projectile.global_position = global_position
	projectile.direction = direction
	projectile.projectile_color = projectile_color
	projectile.shooter = get_parent()
	entities.add_child(projectile)
