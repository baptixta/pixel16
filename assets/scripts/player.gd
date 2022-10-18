extends KinematicBody2D
class_name Player

onready var animation: AnimationPlayer = get_node("AnimationPlayer")
onready var animationWeapon: AnimationPlayer = get_node("AnimationWeapon")
onready var sprite: Sprite = get_node("Sprite")
onready var weapon: Sprite = get_node("Weapon")
onready var enemy = get_node("/root/Level/Player")
var velocity: Vector2
export(int) var speed



func _physics_process(_delta):
	move()
	animate()
	verifyPosition()	
	moveWeapon()
	attack()

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

func moveWeapon() -> void:
	weapon.look_at(get_global_mouse_position())
	weapon.rotate(90)

func attack() -> void:
	if Input.is_action_just_pressed("attack"):
		animationWeapon.play("weapon_attack")


func _on_Area2D_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_Area2D_body_entered(body: Node) -> void:
	print("teste")
