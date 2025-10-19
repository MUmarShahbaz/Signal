extends RigidBody2D
class_name Projectile

@onready var sprite:Sprite2D = $Sprite
@onready var killzone: Area2D = $KillZone

var sprite1 = preload("res://components/shot/sprite1.png")
var sprite2 = preload("res://components/shot/sprite2.png")

signal killed_virus()
signal killed_hacker()

func set_shooter(shooter):
	if shooter is Player:
		sprite.texture = sprite1
		killzone.collision_mask = 4
	else:
		sprite.texture = sprite2
		killzone.collision_mask = 3

func _on_body_entered(body: Node2D) -> void:
	if body is Virus: emit_signal("killed_virus")
	if body is Hacker: emit_signal("killed_hacker")
	body.queue_free()
	queue_free()
