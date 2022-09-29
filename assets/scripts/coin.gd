extends StaticBody2D

onready var sprite: Sprite = get_node("Sprite")
onready var animation: AnimationPlayer = get_node("Animation")

func _physics_process(_delta) -> void:
	animate()
	
func animate():
	animation.play("spin")
