extends Node2D

onready var player = get_node("../../Player")
onready var initial_position = position - player.position
onready var Asteroid = preload("res://Assroid/Asteroid/Asteroid.tscn")

func _process(delta):
	position = initial_position + player.position
	
	if randf() < 0.01:
		spawn_asteroid()

func spawn_asteroid():
	var asteroid = Asteroid.instance()
	asteroid.position = position
	get_tree().root.add_child(asteroid)
