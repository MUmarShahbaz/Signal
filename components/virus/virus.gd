extends CharacterBody2D
class_name Virus

@export_range(0, 1) var max_angle: float = 0.3

@onready var sprite: Sprite2D = $Sprite
var sp1 : CompressedTexture2D = preload("res://components/virus/sprite1.png")
var sp2 : CompressedTexture2D = preload("res://components/virus/sprite2.png")

var y

func _ready() -> void:
	sprite.texture = sp1 if randi_range(0, 1) == 0 else sp2
	y = randf_range(-max_angle, max_angle)

func _process(delta: float) -> void:
	velocity = Vector2(-1, y).normalized() * 400
	move_and_slide()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.queue_free()
		queue_free()
