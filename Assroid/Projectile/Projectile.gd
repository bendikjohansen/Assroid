extends RigidBody2D

const SPEED = 400

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var projectile_color = Color(1, 1, 1)

func _ready():
	rotation = direction.angle()
	velocity = direction.normalized() * SPEED
	get_node("Sprite").set_modulate(projectile_color)
	
	apply_impulse(Vector2.ZERO, velocity)

func _on_Projectile_body_entered(body):
	queue_free()
