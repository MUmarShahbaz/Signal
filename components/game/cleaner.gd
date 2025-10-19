extends Area2D

var player = preload("res://components/player/player.tscn")

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()

func start():
	await get_tree().create_timer(1.0).timeout
	var new_player = player.instantiate()
	add_sibling(new_player)
