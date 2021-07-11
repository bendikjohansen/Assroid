extends CPUParticles2D


func _input(event):
	if event.is_action_pressed("thrust"):
		emitting = true
	elif event.is_action_released("thrust"):
		emitting = false
