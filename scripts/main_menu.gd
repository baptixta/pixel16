extends Node3D

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and Input.is_action_pressed("start_game"):
			get_tree().change_scene_to_file("res://scene/main.tscn")
