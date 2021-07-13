extends RigidBody2D

const SPEED = 400

onready var SoundEffect = preload("res://Assroid/SoundEffects/Shoot.tscn")

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var projectile_color = Color(1, 1, 1)
var shooter = ''

signal hit(body, projectile)

func _ready():
	add_to_group("projectiles")
	rotation = direction.angle()
	velocity = direction.normalized() * SPEED
	get_node("Sprite").set_modulate(projectile_color)

	for member in get_tree().get_nodes_in_group("health"):
		connect("hit", member, "_on_Projectile_hit")
	
	var soundEffect = SoundEffect.instance()
	soundEffect.set_position(position)
	get_tree().root.add_child(soundEffect)

	apply_impulse(Vector2.ZERO, velocity)

func _on_Projectile_body_entered(body):
	emit_signal("hit", body, self)
	queue_free()
