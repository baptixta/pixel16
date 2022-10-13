extends KinematicBody2D
class_name Player

onready var animation: AnimationPlayer = get_node("AnimationPlayer")
onready var sprite: Sprite = get_node("Sprite")
onready var weapon: Sprite = get_node("Weapon")
var velocity: Vector2
export(int) var speed


func _physics_process(_delta):
	move()
	animate()
	verifyPosition()	
	moveWeapon()

func move() -> void:
	var direction_vector: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	
	velocity = direction_vector * speed
	velocity = move_and_slide(velocity)
	
func animate() -> void:
	if velocity != Vector2.ZERO:
		animation.play("walk")
	else:
		animation.play("idle")
	
func verifyPosition() -> void:
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

func moveWeapon():
	weapon.look_at(get_global_mouse_position())
