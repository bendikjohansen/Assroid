extends Node2D

const FIELD_OF_VIEW = 350
onready var player = get_node("/root/Game/WorldEnvironment/Player")
var is_within_sight = false

signal player_sighted(player_position, distance_to_player)
signal player_escaped()

func _process(_delta):
	if !is_instance_valid(player):
		return
	
	var distance_to_player = abs(player.position.distance_to(global_position))
	if distance_to_player < FIELD_OF_VIEW:
		is_within_sight = true
		emit_signal("player_sighted", player.position, distance_to_player)
	elif is_within_sight:
		is_within_sight = false
		emit_signal("player_escaped")
