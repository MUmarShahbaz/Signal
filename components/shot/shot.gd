extends RigidBody2D
class_name Projectile

@onready var sprite:Sprite2D = $Sprite
@onready var killzone: Area2D = $KillZone

var sprite1 = preload("res://components/shot/sprite1.png")
var sprite2 = preload("res://components/shot/sprite2.png")

func set_shooter(shooter):
	if shooter is Player:
		sprite.texture = sprite1
		killzone.collision_mask = 4
	else:
		sprite.texture = sprite2
		killzone.collision_mask = 3

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	queue_free()
