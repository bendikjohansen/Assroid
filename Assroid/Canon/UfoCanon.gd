extends "res://Assroid/Canon/Canon.gd"

func _on_UfoSight_player_sighted(player_position, distance_to_player):
	if randf() < 0.01:
		shoot(player_position - global_position, Color(0, 1, 0.5))
