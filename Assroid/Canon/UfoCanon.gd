extends "res://Assroid/Canon/Canon.gd"

onready var ufo = get_parent()

const RADIUS = 25

func _on_UfoSight_player_sighted(player_position: Vector2, distance_to_player: float):
	global_position = ufo.global_position.move_toward(player_position, RADIUS)
	
	if randf() < 0.01:
		shoot(player_position - global_position, Color(0, 1, 0.5))
