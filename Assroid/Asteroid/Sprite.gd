extends Sprite

onready var full_asteroid = preload("res://Assroid/Asteroid/Asteroid_2.png")
onready var half_asteroid = preload("res://Assroid/Asteroid/Asteroid_3.png")
onready var feeble_asteroid = preload("res://Assroid/Asteroid/Asteroid_4.png")

func _on_AsteroidHealth_asteroid_hit(health):
	if health == 2:
		set_texture(half_asteroid)
	if health == 1:
		set_texture(feeble_asteroid)
