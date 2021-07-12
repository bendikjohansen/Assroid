extends Node2D

const ASTEROID_SPAWN_CHANCE = 0.50
const UFO_SPAWN_CHANCE = 0.01

onready var player = get_node("../../Player")
onready var initial_position = position - player.position
onready var Asteroid = preload("res://Assroid/Asteroid/Asteroid.tscn")
onready var Ufo = preload("res://Assroid/Ufo/Ufo.tscn")

func _process(delta):
	if player != null:
		position = initial_position + player.position

func _on_Timer_timeout():
	var roll = randf()
	if roll < UFO_SPAWN_CHANCE:
		spawn_entity(Ufo)
	elif roll < ASTEROID_SPAWN_CHANCE:
		spawn_entity(Asteroid)	

func spawn_entity(Entity):
	var entity = Entity.instance()
	entity.position = position
	get_tree().root.add_child(entity)
