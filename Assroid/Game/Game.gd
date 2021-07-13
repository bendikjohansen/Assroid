extends Node2D

onready var WorldScene = preload("res://Assroid/Game/World.tscn")

func _ready():
	var player_health = get_node("WorldEnvironment/Player/PlayerHealth")
	player_health.connect("player_died", self, "_on_Player_player_died")
	
func _on_Player_player_died():
	var _error = get_tree().reload_current_scene()
