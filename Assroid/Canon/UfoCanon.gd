extends "res://Assroid/Canon/Canon.gd"

const RADIUS = 25

onready var ufo = get_parent()
onready var shoot_interval = $Timer 
var aim_direction = Vector2.ZERO

func _on_UfoSight_player_sighted(player_position: Vector2, distance_to_player: float):
	global_position = ufo.global_position.move_toward(player_position, RADIUS)
	aim_direction = player_position - global_position
	if shoot_interval.is_stopped():
		shoot_interval.start()

func _on_Timer_timeout():
	shoot(aim_direction, Color(0, 1, 0.5))

func _on_UfoSight_player_escaped():
	shoot_interval.stop()
