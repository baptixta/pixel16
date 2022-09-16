extends KinematicBody2D

var player_ref = null
var velocity: Vector2
export(int) var speed

func _physics_process(_delta: float) -> void:
	if player_ref != null:
		pass


func on_body_entered(body):
	if body.is_in_group("player"):
		player_ref = body


func on_body_exited(body):
	if body.is_in_group("player"):
		player_ref = null
