extends "res://Assroid/Canon/Canon.gd"

signal shoot(direction)

func _ready():
	connect("shoot", self, "shoot")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		var direction = Vector2.RIGHT.rotated(get_parent().rotation)
		var color = Color(1.5, 1.5, 0)
		emit_signal("shoot", direction, color)
