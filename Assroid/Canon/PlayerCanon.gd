extends "res://Assroid/Canon/Canon.gd"

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		var direction = Vector2.RIGHT.rotated(get_parent().rotation)
		var color = Color(1.5, 1.5, 0)
		shoot(direction, color)
