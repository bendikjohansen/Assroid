extends CPUParticles2D


func _input(event):
	if event.is_action_pressed("ui_up"):
		emitting = true
	elif event.is_action_released("ui_up"):
		emitting = false
