extends "res://Assroid/Canon/Canon.gd"

signal shoot(direction)

func _ready():
	connect("shoot", self, "shoot")

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("shoot", Vector2.RIGHT.rotated(get_parent().rotation))
