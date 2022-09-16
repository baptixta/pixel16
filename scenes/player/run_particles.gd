extends AnimatedSprite

func play_particles():
	play()
	
func on_animation_finished():
	queue_free()
