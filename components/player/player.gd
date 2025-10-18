extends CharacterBody2D

@onready var anim_tree: AnimationTree = $animation_tree
@export var anim_speed:= 8.0
@export var move_speed:= 600

var pointing_at := 0.0

func _physics_process(delta: float) -> void:
	var target: float = Input.get_axis("up", "down")
	pointing_at = lerp(pointing_at, target, anim_speed * delta)
	anim_tree.set("parameters/Move/blend_position", pointing_at)

	velocity.y = move_speed * target * delta * 100
	move_and_slide()
