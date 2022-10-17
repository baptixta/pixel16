extends KinematicBody2D
class_name EnemyTemplate

onready var sprite: Sprite = get_node("Sprite")
onready var collision: CollisionShape2D = get_node("Collision")
onready var animation: AnimationPlayer = get_node("Animation")

var can_die: bool = false
var can_hit: bool = false
var can_attack: bool = false

export(int) var walk_speed
onready var player_ref = get_node("/root/Level/Player")

func _physics_process(_delta: float) -> void:
	move()

func move():
	if player_ref:
		var direction = (player_ref.position - position).normalized()
		move_and_slide(direction * walk_speed)
		animation.play("run")
